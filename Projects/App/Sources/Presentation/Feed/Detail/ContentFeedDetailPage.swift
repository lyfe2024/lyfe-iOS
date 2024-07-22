//
//  ContentFeedDetailView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine
import Kingfisher
import DesignSystem

class ContentFeedDetailPageModel: ObservableObject {
    @Published var postData: BoardResponseDTO?
    @Published var feedType: FeedType?
    @Published var comments: [BoardResponseDTO]?
    @Published var commentState: Bool = false
    @Published var popupToggle: Bool = false
    @Published var alertToggle: Bool = false
    
    private let networkService = BoardNetwork()
    private var cancellables = [AnyCancellable]()
    
    func getBoardDetail() {
        networkService
            .boardDetail("31") { result in
                switch result {
                case .success(let data):
                    self.postData = data
                    data.boardType == "BOARD"
                    ? (self.feedType = .board) : (self.feedType = .board_picture)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
    }
    
    func getComments() {
        guard let postId = postData?.id else { return }
        networkService //cursorId, board_id
            .getComments("\(postId)", "1") { result in
                switch result {
                case .success(let success):
                    self.comments = success.list
                case .failure(let error):
                    print("🚨 SY Failure! Detail > GetComments > \(error.localizedDescription)")
                }
            }
    }
}

struct ContentFeedDetailPage: View {
    @StateObject private var viewModel = ContentFeedDetailPageModel()
    @EnvironmentObject var router: Router
    let photoSize = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(viewModel.postData?.topic ?? "")
                        .applyFont(font: .heading4)
                        .foregroundColor(.MainE86336)
                    Spacer().frame(height: 16)
                    
                    if let boardType = viewModel.feedType {
                        switch boardType {
                        case .board:
                            boardView()
                        case .board_picture:
                            pictuerView()
                        }
                    }
                    
                    PostUserComponent(viewModel: viewModel)
                }
                .padding(.horizontal, 20)
                
                RectangleComponent(color: Color.grayF9F9F9, height: 8)
                
                LazyVStack {
                    ForEach (viewModel.comments ?? [], id: \.id) { index in
                        CommentUserPage(postUser: viewModel.postData ?? .init(),
                                        commentUser: viewModel.comments ?? [],
                                        infoButtonTooggle: viewModel.popupToggle)
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
            
            commentView()
        }
        .onAppear { viewModel.getBoardDetail() }
        .onTapGesture { viewModel.popupToggle = false }
        // TODO: - 사용자 본인 글인지아닌지 구분 필요
        .overlay(alignment: .topTrailing) {
            PostPopup(type: .doubleBtn)
                .tapRemove {
                    viewModel.popupToggle = false
                    viewModel.alertToggle = true
                }
                .tapUpdate {
                    viewModel.popupToggle = false
                    viewModel.alertToggle = true
                }
                .opacity(viewModel.popupToggle ? 1 : 0)
                .offset(x: -20)
        }
        .LyfeNavigationDoubleButton(LyfeCommon.ic_black_info, LyfeCommon.ic_black_arrow_back, LButton: {
            router.navigateBack()
        }, RButton: {
            viewModel.popupToggle = true
        })
        .customAlert(
            isShowing: $viewModel.alertToggle,
            type: .doubleButton(leftTitle: "신고", rightTitle: "취소"), title: "신고하시겠어요?", desc: "", 
            confirmButton:  {
                viewModel.alertToggle = false
            }) {
                viewModel.alertToggle = false
            }
    }
    
    @ViewBuilder func boardView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.postData?.title ?? "")
                .applyFont(font: .title1)
                .lineLimit(2)
            
            Text(viewModel.postData?.content ?? "")
                .applyFont(font: .body2)
        }
    }
    
    @ViewBuilder func pictuerView() -> some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                ZStack {
                    Rectangle()
                        .fill(Color.Gray393939)
                        .frame(width: photoSize, height: photoSize)
                        .overlay {
                            if let profileURLString = viewModel.postData?.imageUrl,
                               let profileURL = URL(string: profileURLString) {
                                KFImage(profileURL)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                            }
                            
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                               startPoint: .top, endPoint: .bottom)
                            }
                        }
                }
                
                LyfeText(text: viewModel.postData?.title ?? "", color: .white, font: .title1)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
                    .lineLimit(2)
            }
        }
    }
    
    @ViewBuilder func commentView() -> some View {
        LyfeText(text: "댓글을 남겨보세요", color: Color.grayC6C6C6, font: .body2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.GrayC6C6C6, lineWidth: 1)
            )
            .padding(.horizontal, 12)
            .onTapGesture {
                viewModel.commentState.toggle()
            }
            .sheet(isPresented: $viewModel.commentState,
                   content: { CommentComponent(
                    userName: .constant("안녕"),
                    viewModel: viewModel
                   )
                .presentationDetents([.height(134)])
            })
    }
}

#Preview {
    NavigationStack {
        ContentFeedDetailPage()
    }
}

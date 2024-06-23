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

enum BoardType {
    case board
    case board_picture
}

class ContentFeedDetailPageModel: ObservableObject {
    @Published var realPostUser: BoardResponseDTO?
    @Published var boardType: BoardType?
    @Published var postUser: HomeSample = HomeSample.sampleUser // 임시
    @Published var commentUser: [HomeSample] = HomeSample.homeSample
    @Published var commentState: Bool = false
    @Published var popupToggle: Bool = false
    
    private let networkService = BoardNetwork()
    private var cancellables = [AnyCancellable]()
    
    func getBoardDetail() {
        networkService
            .boardDetail("31") { result in
                switch result {
                case .success(let data):
                    self.realPostUser = data
                    
                    data.boardType == "BOARD" 
                    ? (self.boardType = .board) : (self.boardType = .board_picture)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
    }
}

struct ContentFeedDetailPage: View {
    @StateObject private var viewModel = ContentFeedDetailPageModel()
    @EnvironmentObject var router: Router
    let photoSize = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.realPostUser?.topic ?? "")
                    .applyFont(font: .heading4)
                    .foregroundColor(.MainE86336)
                Spacer().frame(height: 16)
                
                if let boardType = viewModel.boardType {
                    switch boardType {
                    case .board:
                        VStack(alignment: .leading, spacing: 16) {
                            Text(viewModel.realPostUser?.title ?? "")
                                .applyFont(font: .title1)
                                .lineLimit(2)
                            
                            Text(viewModel.realPostUser?.content ?? "")
                                .applyFont(font: .body2)
                        }
                    case .board_picture:
                        VStack(alignment: .leading) {
                            ZStack(alignment: .bottomLeading) {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.Gray393939)
                                        .frame(width: photoSize, height: photoSize)
                                        .overlay {
                                            if let profileURLString = viewModel.realPostUser?.imageUrl,
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
                                
                                Text(viewModel.postUser.title)
                                    .applyFont(font: .title1)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 16)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
                
                PostUserComponent(viewModel: viewModel)
            }
            .padding(.horizontal, 20)
            
            RectangleComponent(color: Color.grayF9F9F9, height: 8)
            
            LazyVStack {
                ForEach (viewModel.commentUser, id: \.self) { index in
                    CommentUserPage(sampleUser: viewModel.postUser,
                                    commentUser: HomeSample.homeSample,
                                    infoButtonTooggle: viewModel.popupToggle)
                }
            }
            .padding(.horizontal, 20)
            
        }
        .onAppear {
            viewModel.getBoardDetail()
        }
        .navigationBackButton {
            router.navigateBack()
        }
        .navigationRightButton(image: "Info_black") {
            print("info button tapped")
        }
        
        Text("댓글을 남겨보세요")
            .applyFont(font: .body2)
            .foregroundStyle(Color.GrayC6C6C6)
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
                   content: { CommentComponent(userName: .constant("안녕"),
                                               viewModel: viewModel)
                .presentationDetents([.height(134)])
            })
    }
}

#Preview {
    NavigationStack {
        ContentFeedDetailPage()
    }
}

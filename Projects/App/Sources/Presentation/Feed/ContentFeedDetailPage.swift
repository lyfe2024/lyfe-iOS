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

import SwiftUI
import Combine
import Kingfisher

enum BoardType {
    case board
    case board_picture
}

class ContentFeedDetailPageModel: ObservableObject {
    @Published var realPostUser: BoardResponseDTO?
    @Published var boardType: BoardType?
    @Published var postUser: HomeSample = HomeSample.sampleUser // 임시
    @Published var commentUser: [HomeSample] = HomeSample.homeSample
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
    @StateObject var viewModel = ContentFeedDetailPageModel()
    @EnvironmentObject var router: Router
    let photoSize = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                Text(viewModel.realPostUser?.topic ?? "")
                    .font(.bold(22))
                    .foregroundColor(.MainE86336)
                Spacer().frame(height: 16)
                
                if let boardType = viewModel.boardType {
                    switch boardType {
                    case .board:
                        VStack(alignment: .leading, spacing: 16) {
                            Text(viewModel.realPostUser?.title ?? "")
                                .font(.bold(20))
                                .lineLimit(2)
                                .lineSpacing(2.4)
                            
                            Text(viewModel.realPostUser?.content ?? "")
                                .font(.regular(18))
                                .lineSpacing(1.5)
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
                                    .font(.bold(20))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 16)
                                    .lineLimit(2)
                                    .lineSpacing(1.5)
                            }
                        }
                    }
                }
                
                PostUserComponent(viewModel: viewModel)
            }
            .padding(.horizontal, 20)
            
            RectangleComponent()
            
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
        .onTapGesture {
            print("\(viewModel.popupToggle)")
            viewModel.popupToggle = true
        }
    }
}

#Preview {
    NavigationStack {
        ContentFeedDetailPage()
    }
}

//
//  CommentUserPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CommentUserPage: View {
    @ObservedObject var viewModel: ContentFeedDetailPageModel
    var postUser: BoardResponseDTO?
    var commentUser: [CommentDTO]?
    
    var body: some View {
        VStack(alignment:.leading, spacing: 8) {
            UserProfileComponent(image: postUser?.imageUrl ?? "",
                                 name: postUser?.user?.username ?? "",
                                 time: postUser?.updateAt ?? "",
                                 content: postUser?.content ?? "") {
                viewModel.infoButtonTooggle = true
            }
            
            LyfeText(text: "답글 달기", color: Color.grayB0B0B0, font: .caption3)
                .onTapGesture {
                    viewModel.commentButtonToggle.toggle()
                }
            
            LazyVStack {
                ForEach (commentUser ?? [], id: \.id) { user in
                    if viewModel.commentButtonToggle {
                        VStack(spacing: 8) {
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "arrow.turn.down.right")
                                    .foregroundColor(.Gray9B9B9B)
                                    .frame(width: 16, height: 16)
                                
                                UserProfileComponent(image: postUser?.imageUrl ?? "",
                                                     name: postUser?.user?.username ?? "",
                                                     time: postUser?.updateAt ?? "",
                                                     content: postUser?.content ?? "") {
                                    viewModel.infoButtonTooggle = true
                                }
                            }
                            .padding(.bottom, 8)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

//#Preview {
//    CommentUserPage(sampleUser: HomeSample.sampleUser,
//                    commentUser: HomeSample.homeSample,
//                    infoButtonTooggle: false)
//}

//
//  CommentUserPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class CommentUserPageModel: ObservableObject {
    @Published var commentToggle = false
}

struct CommentUserPage: View {
    @StateObject var commentUserPageModel = CommentUserPageModel()
    var sampleUser: HomeSample
    var commentUser: [HomeSample]
    var infoButtonTooggle: Bool
    
    var body: some View {
        VStack(alignment:.leading, spacing: 8) {
            UserProfileComponent(image: sampleUser.image, name: sampleUser.userName, time: sampleUser.updatedAt,
                                 content: sampleUser.content,
                                 infoToggle: infoButtonTooggle)
            
            Button {
                print("답글달기 버튼 tapped")
                commentUserPageModel.commentToggle.toggle()
            } label: {
                Text("답글달기")
                    .font(.regular(14))
                    .foregroundStyle(Color.GrayB0B0B0)
            }
            .buttonStyle(PlainButtonStyle())
            
            LazyVStack {
                ForEach (commentUser, id: \.self) { index in
                    if commentUserPageModel.commentToggle {
                        VStack(spacing: 8) {
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "arrow.turn.down.right")
                                    .foregroundColor(.Gray9B9B9B)
                                    .frame(width: 16, height: 16)
                                
                                UserProfileComponent(image: index.image, name: index.userName, time: index.updatedAt,
                                                     content: index.content,
                                                     infoToggle: infoButtonTooggle)
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

#Preview {
    CommentUserPage(sampleUser: HomeSample.sampleUser, commentUser: HomeSample.homeSample, infoButtonTooggle: false)
}

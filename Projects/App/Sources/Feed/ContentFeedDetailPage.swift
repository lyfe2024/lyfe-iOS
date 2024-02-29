//
//  ContentFeedDetailView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class ContentFeedDetailPageModel: ObservableObject {
    @Published var postUser: HomeSample = HomeSample.sampleUser
    @Published var commentUser: [HomeSample] = HomeSample.homeSample
    @Published var popupToggle: Bool = false
}

struct ContentFeedDetailPage: View {
    
    @StateObject var contentFeedDetailPageModel = ContentFeedDetailPageModel()
    
    var body: some View {
        ScrollView {
            Spacer().frame(height: 16)
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("여기에 오늘의 주제문장 들어갑니다.")
                        .font(.pretendardBold22)
                        .foregroundColor(.MainE86336)
                    
                    Text("\(contentFeedDetailPageModel.postUser.title) 두줄까지 들어가고 넘어가는 건 어떨까요")
                        .font(.pretendardBold20)
                        .lineLimit(2)
                        .lineSpacing(2.4)
                    
                    Text(contentFeedDetailPageModel.postUser.content)
                        .font(.pretendardRegular18)
                        .lineSpacing(1.5)
                    
                    PostUserView(postUser: contentFeedDetailPageModel.postUser)
                    
                    RectangleView()
                }
                
                LazyVStack {
                    ForEach (contentFeedDetailPageModel.commentUser, id: \.self) { index in
                        CommentUserPage(sampleUser: contentFeedDetailPageModel.postUser,
                                        commentUser: HomeSample.homeSample,
                                        infoButtonTooggle: contentFeedDetailPageModel.popupToggle)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .onTapGesture {
            print("\(contentFeedDetailPageModel.popupToggle)")
            contentFeedDetailPageModel.popupToggle = true
        }
    }
}

#Preview {
    ContentFeedDetailPage()
}

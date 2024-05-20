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
    @Published var commentState: Bool = false
}

// 글 피드 상세 뷰
struct ContentFeedDetailPage: View {
    @StateObject private var contentFeedDetailPageModel = ContentFeedDetailPageModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            Spacer().frame(height: 16)
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("여기에 오늘의 주제문장 들어갑니다.")
                        .font(.bold(20))
                        .foregroundColor(.MainE86336)
                    
                    Text("\(contentFeedDetailPageModel.postUser.title) 두줄까지 들어가고 넘어가는 건 어떨까요")
                        .font(.bold(18))
                        .lineLimit(2)
                        .padding(.vertical, 5)
                    
                    Text(contentFeedDetailPageModel.postUser.content)
                        .font(.regular(16))
                        .padding(.vertical, 4)
                    
                    PostUserComponent(postUser: contentFeedDetailPageModel.postUser)
                }
                .padding(.horizontal, 20)
                
                RectangleComponent()
                
                LazyVStack {
                    ForEach (contentFeedDetailPageModel.commentUser, id: \.self) { index in
                        CommentUserPage(sampleUser: contentFeedDetailPageModel.postUser,
                                        commentUser: HomeSample.homeSample,
                                        infoButtonTooggle: contentFeedDetailPageModel.popupToggle)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .onTapGesture {
            print("\(contentFeedDetailPageModel.popupToggle)")
            contentFeedDetailPageModel.popupToggle = true
        }
        .navigationBackButton {
            router.navigateBack()
        }
        .navigationRightButton(image: "Info_black") {
            print("info button tapped")
        }
        
        Text("댓글을 남겨보세요")
            .font(.medium(16))
            .padding(.vertical, 4)
            .foregroundStyle(Color.GrayC6C6C6)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.GrayC6C6C6, lineWidth: 1)
            )
            .padding(.horizontal, 12)
            .onTapGesture {
                contentFeedDetailPageModel.commentState.toggle()
            }
            .sheet(isPresented: $contentFeedDetailPageModel.commentState, content: {
                CommentComponent(userName: .constant("안녕"),
                                 viewModel: contentFeedDetailPageModel)
                .presentationDetents([.height(104)])
            })
    }
}

#Preview {
    NavigationStack {
        ContentFeedDetailPage()
    }
}

//
//  FeedDetailView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/04.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class FeedDeatilViewMode: ObservableObject {
    @Published var postUser: HomeSample = HomeSample.sampleUser
}

// 주제 상세 뷰
struct PhotoFeedDetailPage: View {
    @StateObject var feedDetailViewModel = FeedDeatilViewMode()
    
    let photoSize = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            Spacer().frame(height: 16)
            
            VStack(alignment: .leading) {
                Text("여기에 오늘의 주제문장 들어갑니다.")
                    .font(.pretendardBold22)
                    .foregroundColor(.MainE86336)
                    .padding(.leading, 20)
                
                ZStack(alignment: .bottomLeading) {
                    ZStack {
                        
                        Rectangle()
                            .fill(.black)
                            .frame(width: photoSize, height: photoSize)
                            .overlay {
                                Image(feedDetailViewModel.postUser.image)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                                    startPoint: .top, endPoint: .bottom)
                                }
                                .opacity(0.8)
                            }
                    }
                    
                    Text("사진 제목 텍스트 \n두줄까지 들어가고 넘어가는건 어떠떨까요")
                        .font(.pretendardBold20)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                }
                
                // 글쓴이 정보뷰
                PostUserView(postUser: feedDetailViewModel.postUser)
                .padding(.horizontal, 20)
                
                RectangleView()
                
                // TODO: 댓글 랜덤 수정
                ForEach(0..<10, id:\.self) { index in
                    CommentUserView(sampleUser: feedDetailViewModel.postUser)
                    Divider()
                        .padding(.vertical, 8)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    PhotoFeedDetailPage()
}

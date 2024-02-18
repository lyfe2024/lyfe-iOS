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
struct FeedDetailView: View {
    @StateObject var feedDetailViewModel = FeedDeatilViewMode()
    
    let photoSize = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("여기에 오늘의 주제문장 들어갑니다.")
                .font(.pretendardBold20)
                .foregroundColor(.MainE86336)
                .padding(.leading, 20)
            
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(.black)
                    .frame(width: photoSize, height: photoSize)
                    .overlay {
                        Image(feedDetailViewModel.postUser.image)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                    }
                Text("사진 제목 텍스트 \n두줄까지 들어가고 넘어가는건 어떠떨까요")
                    .font(.pretendardBold18)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
            }
            
            // 글쓴이 정보뷰
            PostUserView(postUser: feedDetailViewModel.postUser)
            .padding(.horizontal, 20)
            
            RectangleView()
            
            // 댓글뷰
            CommentUserView(sampleUser: feedDetailViewModel.postUser)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    FeedDetailView()
}

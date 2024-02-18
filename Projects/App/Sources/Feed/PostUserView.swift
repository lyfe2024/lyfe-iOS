//
//  PostUserView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

/// 포스트 작성한 글쓴이에 대한 공통 뷰
struct PostUserView: View {
    var postUser: HomeSample
    
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                HStack(spacing: 4){
                    Image("BlackWine")
                    Text("\(postUser.whisky)")
                }
                HStack(spacing: 2) {
                    Image("BlackComment")
                    Text("댓글")
                    Text("\(postUser.whisky)") // commentCount
                }
            }
            
            Spacer()
            HStack(spacing: 8) {
                Image(postUser.image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 32, height: 32)
                    
                VStack(alignment: .leading, spacing: 0){
                    Text(postUser.userName)
                        .font(.pretendardBold14)
                    Text(postUser.updatedAt)
                        .font(.pretendardRegular10)
                        .foregroundColor(.GrayC6C6C6)
                }
            }
        }
    }
}

#Preview {
    PostUserView(postUser: HomeSample.sampleUser)
}
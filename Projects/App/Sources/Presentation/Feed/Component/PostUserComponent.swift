//
//  PostUserView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

// 글쓴이 뷰
struct PostUserComponent: View {
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
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    
                VStack(alignment: .leading, spacing: 0){
                    Text(postUser.userName)
                        .font(.bold(16))
                    Text(postUser.updatedAt)
                        .font(.regular(12))
                        .foregroundColor(.GrayC6C6C6)
                }
            }
        }
    }
}

#Preview {
    PostUserComponent(postUser: HomeSample.sampleUser)
}

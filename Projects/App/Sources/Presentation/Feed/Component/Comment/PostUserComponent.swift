//
//  PostUserView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Kingfisher
import DesignSystem

// 글쓴이 뷰
struct PostUserComponent: View {
    @ObservedObject var viewModel: ContentFeedDetailPageModel
    
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                HStack(spacing: 4){
                    LyfeCommon.ic_black_whiskey_empty
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(viewModel.postData?.whiskyCount ?? 0)")
                }
                HStack(spacing: 2) {
                    LyfeCommon.ic_black_comment
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("댓글")
                    Text("\(viewModel.postData?.commentCount ?? 0)")
                }
            }
            .font(.semiBold(14))
            .padding(.vertical, 4)
            
            Spacer()
            HStack(spacing: 8) {
                if let profileURLString = viewModel.postData?.user?.profile,
                   let profileURL = URL(string: profileURLString) {
                    KFImage(profileURL)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } else {
                    LyfeCommon.ic_gray_none_user
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
                    
                VStack(alignment: .leading, spacing: 0){
                    Text(viewModel.postData?.user?.username ?? "")
                        .font(.bold(14))
                        .padding(.vertical, 4)
                    Text(viewModel.postData?.updateAt ?? "몇 분전")
                        .font(.regular(10))
                        .padding(.vertical, 3)
                        .foregroundColor(.GrayC6C6C6)
                }
            }
        }
    }
}

//#Preview {
//    PostUserComponent(viewModel: ContentFeedDetailPageModel())
//}

//
//  MypagePostPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

class MyPagePostPageModel: ObservableObject {
    @Published var sampleData = HomeSample.sampleUser
}

struct MypagePostPage: View {
    @StateObject var mypageViewModel = MyPagePostPageModel()
    
    @ObservedObject var viewModel: MypageMainViewModel
    var body: some View {
        VStack {
            let count = viewModel.userBoardList.count
            
            ForEach(0..<viewModel.userBoardList.count) { i in
                MypageUserComment(data: viewModel.userBoardList[i])
            }
        }
    }
}

struct MypageUserComment: View {
    
    let data: BoardResponseDTO
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("몇 분전")
                .applyFont(font: .caption4)
                .foregroundStyle(Color.GrayB0B0B0)
            
            Text("\(PublicSample.title)")
                .applyFont(font: .title2)
            
            Text("\(PublicSample.content)")
                .applyFont(font: .body3)
                .lineLimit(2)
            
            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image("GrayWine")
                    Text("\(data.whiskyCount ?? 0)")
                }
                
                HStack(spacing: 4) {
                    Image("GrayComment")
                    Text("\(data.commentCount ?? 0)")
                }
            }
            .applyFont(font: .caption3)
            .foregroundStyle(Color.GrayB0B0B0)
        }
        
        Rectangle()
            .fill(Color.GrayDDDDDD)
            .frame(maxWidth: .infinity, maxHeight: 1)
            .padding(.vertical, 12)
    }
}

#Preview {
    MypagePostPage(viewModel: MypageMainViewModel())
}

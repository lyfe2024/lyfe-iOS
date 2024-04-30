//
//  MypagePostPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct PublicSample {
    static let title = "여기 텍스트 기반 피드 제목 들어옵니다. "
    static let content = "여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지"
}

class MyPagePostPageModel: ObservableObject {
    @Published var sampleData = HomeSample.sampleUser
}

struct MypagePostPage: View {
    @StateObject var mypageViewModel = MyPagePostPageModel()
    
    var body: some View {
        VStack {
            ForEach(0..<10) { _ in
                MypageUserComment(sampleData: mypageViewModel.sampleData)
            }
        }
    }
}

struct MypageUserComment: View {
    
    let sampleData: HomeSample
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("몇 분전")
                .font(.regular(10))
                .foregroundStyle(Color.GrayB0B0B0)
                .padding(.vertical, 3)
            
            Text("\(PublicSample.title)")
                .font(.bold(16))
                .padding(.vertical, 3)
            
            Text("\(PublicSample.content)")
                .font(.medium(14))
                .padding(.vertical, 4)
                .lineLimit(2)
            
            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image("GrayWine")
                    Text("\(sampleData.whisky)")
                }
                
                HStack(spacing: 4) {
                    Image("GrayComment")
                    Text("\(sampleData.whisky)")
                }
            }
            .font(.regular(12))
            .foregroundStyle(Color.GrayB0B0B0)
        }
        
        Rectangle()
            .fill(Color.GrayDDDDDD)
            .frame(maxWidth: .infinity, maxHeight: 1)
            .padding(.vertical, 12)
    }
}

#Preview {
    MypagePostPage()
}

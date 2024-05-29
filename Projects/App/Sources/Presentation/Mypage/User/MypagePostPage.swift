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
                    Text("\(sampleData.whisky)")
                }
                
                HStack(spacing: 4) {
                    Image("GrayComment")
                    Text("\(sampleData.whisky)")
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
    MypagePostPage()
}

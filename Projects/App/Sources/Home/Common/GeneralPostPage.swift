//
//  GeneralPostView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/26.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

// 홈뷰에 있는 포스트의 공통 뷰
//TODO: sampleData 배열화
struct GeneralPostPage: View {
    var sampleData: HomeSample
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                Image(sampleData.image)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                Text(sampleData.userName)
                    .font(.bold(14))
                Text(sampleData.updatedAt)
                    .font(.regular(10))
                    .foregroundColor(.GrayC6C6C6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text(sampleData.title)
                .font(.bold(16))
            Text(sampleData.content)
                .lineSpacing(1.5)
                .lineLimit(2)
                .font(.bold(14))
            
            HStack(spacing: 16) {
                HStack(spacing: 2) {
                    Image("GrayWine")
                    Text("40")
                }
                
                HStack(spacing: 2) {
                    Image("GrayComment")
                    Text("8")
                }
            }
            .foregroundColor(Color.GrayB0B0B0)
            .font(.regular(14))
        }
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    GeneralPostPage(sampleData: HomeSample.homeSample[1])
}

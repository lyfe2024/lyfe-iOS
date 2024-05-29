//
//  CarouselContentView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/29.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CarouselContentView: View {
    let data: HomeSample
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                Image(data.profile)
                    .frame(width: 24, height: 24)
                    .scaledToFit()
                    .clipShape(Circle())
                
                Text(data.userName)
                    .applyFont(font: .title3)
                Text("몇 분전")
                    .applyFont(font: .caption4)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(PublicSample.title)
                    .applyFont(font: .title2)
                Text(PublicSample.content)
                    .applyFont(font: .body3)
                    .lineLimit(2)
            }
            
            HStack(spacing: 16) {
                HStack(spacing: 2){
                    LyfeCommon.ic_gray_glass_empty
                        .frame(width: 16, height: 16)
                    Text("\(data.whisky)")
                }

                HStack(spacing: 2) {
                    LyfeCommon.ic_gray_comment
                        .frame(width: 16, height: 16)
                    Text("\(data.whisky)")
                }
            }
            .applyFont(font: .caption3)
            .foregroundStyle(Color.grayC6C6C6)
        }
        .padding(.init(top: 16, leading: 12, bottom: 16, trailing: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.grayDDDDDD, lineWidth: 1)
        )
    }
}

#Preview {
    CarouselContentView(data: HomeSample.sampleUser)
}

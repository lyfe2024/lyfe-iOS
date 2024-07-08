//
//  CarouselContentView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/29.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher

struct CarouselContentView: View {
    let data: BoardResponseDTO
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                KFImage(URL(string: data.user?.profile ?? ""))
                    .placeholder {
                        ProgressView()
                            .tint(Color.mainE86336)
                    }
                    .resizable()
                    .frame(width: 24, height: 24)
                    .scaledToFit()
                    .clipShape(Circle())
                
                Text(data.user?.username ?? "")
                    .applyFont(font: .title3)
                Text("몇 분전")
                    .applyFont(font: .caption4)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(data.title ?? "")
                    .applyFont(font: .title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                Text(data.content ?? "")
                    .applyFont(font: .body3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2)
            }
            .contentShape(Rectangle())
            
            HStack(spacing: 16) {
                HStack(spacing: 2){
                    LyfeCommon.ic_gray_glass_empty
                        .frame(width: 16, height: 16)
                    Text("\(data.whiskyCount ?? 0)")
                }

                HStack(spacing: 2) {
                    LyfeCommon.ic_gray_comment
                        .frame(width: 16, height: 16)
                    Text("\(data.commentCount ?? 0)")
                }
            }
            .applyFont(font: .caption3)
            .foregroundStyle(Color.grayC6C6C6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.init(top: 16, leading: 12, bottom: 16, trailing: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.grayDDDDDD, lineWidth: 1)
        )
    }
}

#Preview {
    CarouselContentView(data: HomeSample.realData)
}



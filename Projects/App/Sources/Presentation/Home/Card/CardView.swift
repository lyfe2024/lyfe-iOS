//
//  CardView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher

struct CardView: View {
    let data: BoardResponseDTO
    
    init(data: BoardResponseDTO) {
        self.data = data
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: data.content ?? "https://picsum.photos/700/700"))
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black.opacity(0.3))
                }
                .overlay(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack(spacing: 8) {
                            KFImage(URL(string: data.user?.profile ?? "https://picsum.photos/700/700"))
                                .placeholder {
                                    ProgressView()
                                        .tint(Color.mainE86336)
                                }
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                                .padding(.vertical, 4)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(data.user?.username ?? "normaluser")
                                    .applyFont(font: .title3)
                                Text(data.updateAt ?? "1111")
                                    .applyFont(font: .caption4)
                            }
                            .foregroundStyle(Color.white)
                        }
                        
                        Spacer()
                        
                        VStack(alignment:.leading, spacing: 0) {
                            HStack(spacing: 2) {
                                LyfeCommon.ic_whtie_whisky_fill
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                
                                Text("\(data.whiskyCount ?? 0)")
                                    .applyFont(font: .body3)
                                    .foregroundStyle(Color.white)
                            }
                            
                            Text(data.title ?? "제목")
                                .applyFont(font: .heading4)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.init(top: 12, leading: 16, bottom: 12, trailing: 16))
                }
                .shadow(color: .black.opacity(0.2), radius: 8.88,  x: 1.78, y: 5.33)
        }
    }
}

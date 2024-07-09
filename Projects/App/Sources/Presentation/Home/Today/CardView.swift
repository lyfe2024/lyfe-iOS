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

struct NoneCardView: View {
    @ObservedObject var viewModel: CardSwipeViewModel
    private let cardHeight: CGFloat = 358
    private let screenPadding: CGFloat = 40
    private var width: CGFloat {
        screenWidth()?.bounds.width ?? UIScreen.main.bounds.width
    }
    
    var body: some View {
        ZStack {
            let cardWidth = width * 0.75
            let minusWidth = (width - screenPadding - cardWidth) / 2
            
            ForEach(0..<4, id: \.self) { index in
                Rectangle()
                    .fill(viewModel.currentIndex == 7 ? CardColors.nineColor[index] :
                            viewModel.currentIndex == 8 ? CardColors.tenColor[index] : CardColors.color[index])
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: cardWidth)
                    .frame(height: index <= 3 ? cardHeight - CGFloat(18 * index) : cardHeight)
                    .offset(x: index == 0 ? -minusWidth : -minusWidth + CGFloat(index * 20))
                    .zIndex(Double(-index))
                    .overlay {
                        VStack {
                            Circle()
                                .fill(Color.gray9B9B9B)
                                .frame(width: 128, height: 128)
                                .overlay {
                                    VStack(spacing: 4) {
                                        LyfeCommon.ic_white_arrow_after
                                            .resizable()
                                            .frame(width: 56, height: 56)
                                        Text("더보기")
                                            .applyFont(font: .heading5)
                                            .foregroundStyle(Color.white)
                                    }
                                }
                        }
                        .offset(x: -minusWidth)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 8.88,  x: 1.78, y: 5.33)
            }
        }
    }
}



struct CardColors {
    static let nineColor = [Color.grayB0B0B0, Color.grayB0B0B0, Color.grayB0B0B0, Color.grayC6C6C6]
    static let tenColor = [Color.grayB0B0B0, Color.grayB0B0B0, Color.grayC6C6C6, Color.grayDDDDDD]
    static let color = [Color.grayB0B0B0, Color.grayC6C6C6, Color.grayDDDDDD, Color.grayF9F9F9]
}


//
//  TestCardView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CardSwipeView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject private var viewModel: HomeMainPageModel
    @State private var removingTopCard = false
    @State private var offset: CGSize = .zero
    @State private var isDragging: Bool = false
    
    private let cardHeight: CGFloat = 358
    private let screenPadding: CGFloat = 40
    private var width: CGFloat {
        screenWidth()?.bounds.width ?? UIScreen.main.bounds.width
    }
    
    init(viewModel: HomeMainPageModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            let cardWidth = width * 0.75
            let minusWidth = (width - screenPadding - cardWidth) / 2
            
            ForEach(viewModel.totalData.indices, id: \.self) { index in
                Group {
                    if let boardData = viewModel.totalData[index] as? BoardResponseDTO {
                        CardView(data: boardData)
                    } else if let color = viewModel.totalData[index] as? Color {
                        Rectangle()
                            .fill(color)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
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
                            }
                    }
                }
                .opacity(index == 0 && removingTopCard ? 0 : 1)
                .frame(width: cardWidth)
                .frame(height: index <= 3 ? cardHeight - CGFloat(18 * index) : cardHeight)
                .offset(x: index == 0 
                        ? offset.width - minusWidth : -minusWidth + CGFloat(index * 20),
                        y: index == 0 ? offset.height : 0)
                .zIndex(Double(-index))
                .opacity(index > 3 ? 0 : 1)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if index == 0 {
                                offset = value.translation
                                isDragging = true
                            }
                        }
                        .onEnded { value in
                            let swipe = value.translation.width
                            removingTopCard = true
                            if swipe < -80 && viewModel.tempData.count < 10 {
                                viewModel.tempData.append(viewModel.totalData[index])
                                viewModel.totalData.remove(at: index)
                            
                            } else if swipe > 80 && viewModel.tempData.count > 0 {
                                let lastTemp = viewModel.tempData.removeLast()
                                viewModel.totalData.insert(lastTemp, at: 0)
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                offset = .zero
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    isDragging = false
                                    removingTopCard = false
                                }
                            }
                            
                            print(swipe)
                        }
                )
                .onTapGesture {
//                    router.navigateTo(.setting)
                }
            }
        }
//        .onAppear {
//            viewModel.getLatestBoard(.board_picture)
//        }
    }
}

#Preview {
    CardSwipeView(viewModel: HomeMainPageModel())
}

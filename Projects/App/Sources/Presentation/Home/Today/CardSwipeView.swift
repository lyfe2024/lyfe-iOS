//
//  CardSwipeView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/08.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Kingfisher


class CardSwipeViewModel: ObservableObject {
    @Published var currentIndex = 0
}

struct CardSwipeView: View {
    
    @StateObject var cardViewModel = CardSwipeViewModel()
    @ObservedObject var viewModel: HomeMainPageModel
    
    private let cardHeight: CGFloat = 358
    private let screenPadding: CGFloat = 40
    private var width: CGFloat {
        screenWidth()?.bounds.width ?? UIScreen.main.bounds.width
    }
    
    var body: some View {
        ZStack {
            let cardWidth = width * 0.75
            let minusWidth = (width - screenPadding - cardWidth) / 2
            
            NoneCardView(viewModel: cardViewModel)
                .opacity(cardViewModel.currentIndex > 7 ? 1 : 0)
            
            ForEach(0..<4, id: \.self) { index in
                if cardViewModel.currentIndex < viewModel.feedData.count {
                    CardView(data: viewModel.feedData[cardViewModel.currentIndex])
                        .frame(width: cardWidth)
                        .frame(height: index <= 3
                               ? cardHeight - CGFloat(18 * index) : cardHeight)
                        .offset(x: index == 0 ? -minusWidth : -minusWidth + CGFloat(index * 20))
                        .zIndex(Double(-index))
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    
                                }
                                .onEnded { value in
                                    handleSwipeGesture(value: value)
                                    print(cardViewModel.currentIndex + 1)
                                }
                        )
                        .opacity((cardViewModel.currentIndex + 1) > 9 ? 0 : 1)
                }
            }
        }
//        .onAppear {
//            viewModel.getLatestBoard(.board_picture)
//        }
    }
    
    private func handleSwipeGesture(value: DragGesture.Value) {
        if value.translation.width < -80 {
            
            if cardViewModel.currentIndex == viewModel.feedData.count - 1 {
                cardViewModel.currentIndex = viewModel.feedData.count - 1
            } else {
                cardViewModel.currentIndex += 1
            }
        } else if value.translation.width > 80 {
            if cardViewModel.currentIndex == 0 {
                cardViewModel.currentIndex = 0
            } else {
                cardViewModel.currentIndex += 1
            }
        }
    }
}

#Preview {
    CardSwipeView(viewModel: HomeMainPageModel())
}

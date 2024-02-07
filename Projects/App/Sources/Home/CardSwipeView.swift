//
//  CardSwipeView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/08.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI


class CardSwipeViewModel: ObservableObject {
    @Published var sampleData: [HomeSample] = HomeSample.homeSample
    @Published var activeIndex = 1
    @Published var countIndex = 1
    
    /// 데이터 추가? 교체?  함수
    func getMoreData() {
        sampleData = HomeSample.moreSample
    }
}

struct CardSwipeView: View {
    @StateObject var cardSwipeViewModel = CardSwipeViewModel()
    var height = UIScreen.main.bounds.height * 0.45 // 사진 높이
    
    var body: some View {
        ZStack {
            ForEach(cardSwipeViewModel.sampleData.indices, id: \.self) { data in
                CardView(data: cardSwipeViewModel.sampleData[data])
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                if value.translation.width < -100 {
                                    let temp = cardSwipeViewModel.sampleData[data]
                                    cardSwipeViewModel.sampleData.remove(at: data)
                                    cardSwipeViewModel.sampleData.append(temp)
                                    
                                    cardSwipeViewModel.activeIndex = data
                                    cardSwipeViewModel.activeIndex = cardSwipeViewModel.activeIndex + 1
                                    
                                    cardSwipeViewModel.countIndex += 1
                                    
                                    // 만약에 무한으로 추가가 되어야 한다면??
                                    if cardSwipeViewModel.countIndex > 5 {
                                        cardSwipeViewModel.getMoreData()
                                        cardSwipeViewModel.countIndex = 0
                                    }
                                }
                            })
                    )
                    .zIndex(Double(-data))
                    .animation(.easeInOut, value: cardSwipeViewModel.sampleData[data].image)
                    .offset(x: data == cardSwipeViewModel.activeIndex ? 0 : 0 + (CGFloat(data - cardSwipeViewModel.activeIndex) * 16))
                    .frame(height: data == cardSwipeViewModel.activeIndex ? height : height - (CGFloat(data - cardSwipeViewModel.activeIndex) * 16))
                    .opacity(data == 0 ? 1 : 0.6)
                    .disabled(data != 0)
                    .padding(.leading, 16) // 16씩 offset
                    .padding(.trailing, 48)
                
            }
            .shadow(radius: 3)
            
        }
    }
}

#Preview {
    CardSwipeView(cardSwipeViewModel: CardSwipeViewModel())
}

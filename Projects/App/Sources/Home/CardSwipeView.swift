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
    // MARK: - TODO: MVVM 분리
    @Published var activeIndex = 1
    @Published var countIndex = 1
}

struct CardSwipeView: View {
    @StateObject var cardSwipeViewModel = CardSwipeViewModel()
    @State private var activeIndex = 1 // 사진 index 처리를 위한 변수
    @State private var countIndex = 1
    
    var height = UIScreen.main.bounds.height * 0.45 // 사진 높이
    
    var body: some View {
        ScrollView {
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
                                    
                                    activeIndex = data
                                    activeIndex = activeIndex + 1
                                    
                                    countIndex += 1
                                    
                                    // 만약에 무한으로 추가가 되어야 한다면??
                                    if countIndex > 5 {
                                        cardSwipeViewModel.sampleData = HomeSample.moreSample
                                        countIndex = 0
                                    }
                                }
                            })
                    )
                    .zIndex(Double(-data))
                    .animation(.easeInOut, value: cardSwipeViewModel.sampleData[data].image)
                    .offset(x: data == activeIndex ? 0 : 0 + (CGFloat(data - activeIndex) * 16))
                    .frame(height: data == activeIndex ? height : height - (CGFloat(data - activeIndex) * 16))
                    .opacity(data == 0 ? 1 : 0.6)
                    .disabled(data != 0)
                    .padding(.leading, 16) // 16씩 offset
                    .padding(.trailing, 48)

                }
                .shadow(radius: 3)
                
            }
        }
    }
}

#Preview {
    CardSwipeView(cardSwipeViewModel: CardSwipeViewModel())
}

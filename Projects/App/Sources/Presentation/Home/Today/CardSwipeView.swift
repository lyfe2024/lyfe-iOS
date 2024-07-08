//
//  CardSwipeView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/08.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Kingfisher

//class CardSwipeViewModel: ObservableObject {
//    @Published var sampleData: [HomeSample] = HomeSample.homeSample
//    @Published var activeIndex = 1
//    @Published var countIndex = 1
//    
//    /// 임시 데이터 추가? 교체?  함수
//    func getMoreData() {
//        sampleData = HomeSample.homeSample
//    }
//}

//struct CardSwipeView: View {
//    
//    @ObservedObject var viewModel: HomeMainPageModel
//    private let height: CGFloat = 358
//    var body: some View {
//        ZStack {
//            ForEach(viewModel.feedData.indices, id: \.self) { index in
//                CardView(data: viewModel.feedData[index])
//                    
//                    .frame(height: index > 3 ? height - CGFloat(20 * index) : 0)
//                    .offset(x : CGFloat(index == 0 ? 0
//                                        : index < 3 ? index * 50
//                                        : 50*3))
////                    .offset(y: 0)
//                    .zIndex(Double(index))
//            }
//        }
//        .onAppear {
////            viewModel.getLatestBoard(.board_picture)
//        }
//    }
//}

class CardSwipeViewModel: ObservableObject {
    @Published var currendtIndex = 0
    @Published var indexForColor = 0
    
}

struct CardSwipeView: View {
    
//    @StateObject var cardViewMode = CardSwipeViewModel()
    @ObservedObject private var viewModel = HomeMainPageModel()
    @State private var data = HomeSample.realArray
    @State private var currentIndex = 0
    @State private var indexForColor = 0
    private let cardHeight: CGFloat = 358
    private let screenPadding: CGFloat = 40
    private var width: CGFloat {
        screenWidth()?.bounds.width ?? UIScreen.main.bounds.width
    }
    
    var body: some View {
        ZStack {
            let cardWidth = width * 0.75
            let minusWidth = (width - screenPadding - cardWidth) / 2
            
//            NoneCardView(viewModel: cardViewMode)
//                .opacity((cardViewMode.currendtIndex > 7) ? 1 : 0)
            ForEach(0..<4, id: \.self) { index in
                CardView(data: data[currentIndex], type: .data)
                    .frame(width: cardWidth)
                    .frame(height: index <= 3
                           ? cardHeight - CGFloat(18 * index)
                           : cardHeight)
                    .offset(x: index == 0 ? -minusWidth : -minusWidth + CGFloat(index * 20))
                    .zIndex(Double(-index))
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                
                            }
                            .onEnded { value in
                                handleSwipeGesture(value: value)
                            }
                    )
                    .opacity(indexForColor > 9 ? 0 : 1)
            }
        }
    }
    
    private func handleSwipeGesture(value: DragGesture.Value) {
        if value.translation.width < -80 {
//            $cardViewMode.currentIndex = ($cardViewMode.currentIndex == data.count - 1)
//            ? data.count - 1 : ($cardViewMode.currentIndex + 1)
//            
//            $cardViewMode.indexForColor = $cardViewMode.currentIndex + 1
//        } else if value.translation.width > 80 {
//            $cardViewMode.currentIndex = ($cardViewMode.currentIndex == 0)
//            ? $cardViewMode.currentIndex : ($cardViewMode.currentIndex - 1)
//            
//            $cardViewMode.indexForColor = $cardViewMode.currentIndex + 1
        }
    }
}

//
//struct CardSwipeView: View {
//    
//    @ObservedObject var viewModel: HomeMainPageModel
//    var height = UIScreen.main.bounds.height * 0.45 // 사진 높이
//    var width = UIScreen.main.bounds.width * 0.8 // 사진 높이
//    let colorArray: [Color] = [.GrayF9F9F9, .GrayDDDDDD,  .GrayC6C6C6, .GrayB0B0B0]
//    @State private var activeIndex = 1
//    @State private var countIndex = 1
//
//    
//    var body: some View {
//        ZStack {
//            ForEach(viewModel.feedData.indices, id: \.self) { index in
//                CardView(data: viewModel.feedData[index])
//                    .gesture(
//                        DragGesture()
//                            .onEnded({ value in
//                                if value.translation.width < -100 {
//                                    let temp = viewModel.feedData[index]
//                                    viewModel.feedData.remove(at: index)
//                                    viewModel.feedData.append(temp)
//                                    
//                                    activeIndex = index
//                                    activeIndex = activeIndex + 1
//                                    countIndex += 1
//                                    
////                                    // api 확인하고 무한 추가 시 수정 필요
////                                    if countIndex > 5 {
////                                        cardSwipeViewModel.getMoreData()
////                                        cardSwipeViewModel.countIndex = 0
////                                    }
//                                }
//                            })
//                    )
//                    .zIndex(Double(-index))
//                    .animation(.easeInOut, value: viewModel.feedData[index].imageUrl ?? "")
//                    .offset(x: index == activeIndex ? 0 : 0 + (CGFloat(index - activeIndex) * 16))
//                    .frame(height: index == activeIndex ? height : height - (CGFloat(index - activeIndex) * 16))
//                    .aspectRatio(contentMode: .fit)
//                    .opacity(index == 0 ? 1 : 0.6)
//                    .disabled(index != 0)
//                    .padding(.leading, 16) // 16씩 offset
//                    .padding(.trailing, 48)
//            }
//            .shadow(radius: 10, x: 2, y: 6)
//        }
//        .onAppear {
//            viewModel.getLatestBoard(.board_picture)
//        }
//    }
//}

#Preview {
    CardSwipeView()
//    CardSwipeView(viewModel: HomeMainPageModel())
}

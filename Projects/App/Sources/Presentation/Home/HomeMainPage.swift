//
//  HomeMainPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/25.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

class TodayDate: ObservableObject {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd."
        return formatter
    }()
    
    static let date = dateFormatter.string(from: Date())
}

class HomeMainPageModel: ObservableObject {
    
    @Published var todayTopic: String = ""
    @Published var boardUser: BoardResponseDTO?
    @Published var feedType: FeedType?
    @Published var feedData: [BoardResponseDTO] = []
    
    private let topicService = TopicNetwork()
    private let boardService = BoardNetwork()
    private let todayDate = TodayDate.date
    
    func getTodayTopic() {
        topicService.getTodayTopic { result in
            switch result {
            case .success(let success):
                if let topic = success.content {
                    self.todayTopic = topic
                }
                
            case .failure(let failure):
                print("Topic fauilure! \(failure.localizedDescription)")
            }
        }
    }
    
    @MainActor
    func getLatestBoard(_ boardType: FeedType) {
        let todayDate = dateFormatter.string(from: Date())
        
        boardService.getLatestBoard("0", boardType.boardType, todayDate) { result in
            switch result {
            case .success(let success):
                self.feedData = success.list
//                print(self.feedData)
            case .failure(let failure):
                print("Latest List failure! \(failure.localizedDescription)")
            }
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
}

struct HomeMainPage: View {
    @StateObject private var viewModel = HomeMainPageModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Text("\(TodayDate.date)")
                        .foregroundColor(.black)
                        .opacity(0.05)
                        .font(.thinkingRegular(80))
                        .padding(.top, 16)
                    
                    VStack(alignment: .leading) {
                        Image("Logo")
                            .padding(.vertical, 16)

                        Text("\(viewModel.todayTopic)")
                            .applyFont(font: .heading2)
                            .foregroundStyle(Color.mainE86336)
                            .lineLimit(2)
                            .padding(.bottom, 8)
                        CardSwipeView(viewModel: viewModel)
                        Spacer().frame(height: 32)
                    }
                }
                .padding(.horizontal, 20)
                
                RectangleComponent(color: Color.grayDDDDDD, height: 8)
                    .opacity(0.5)
                
                Text("고민글")
                    .applyFont(font: .heading5)
                    .padding(.init(top: 16, leading: 20, bottom: 8, trailing: 0))
                
                CustomCarouselView(pageCount: viewModel.feedData.count,
                                   pageSpacing: 20,
                                   edgeSpacing: 12,
                                   cardSpacing: 8) { index in
                    let item = viewModel.feedData[index]
                    
                    CarouselContentView(data: item)
                }
            }
            
        }
        .onAppear {
//            viewModel.getTodayTopic()
//            viewModel.getLatestBoard(.board)
//            viewModel.getLatestBoard(.board_picture)
        }
    }
}

#Preview {
    HomeMainPage()
}

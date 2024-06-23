//
//  HomeMainPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/25.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

class HomeMainPageModel: ObservableObject {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd."
        return formatter
    }()
    
    private let networkService = TopicNetwork()
    let date = dateFormatter.string(from: Date())
    @Published var todayTopic: String = ""
    
    func getTodayTopic() {
        networkService.getTodayTopic { result in
            switch result {
            case .success(let success):
                if let topic = success.content {
                    self.todayTopic = topic
                    print("topic: \(topic)")
                }
                
            case .failure(let failure):
                print("토픽 실패! \(failure.localizedDescription)")
            }
        }
    }
}

struct HomeMainPage: View {
    @StateObject private var viewModel = HomeMainPageModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Text("\(viewModel.date)")
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
                            
                        CardSwipeView()
                        Spacer().frame(height: 32)
                    }
                }
                .padding(.horizontal, 20)
                
                RectangleComponent(color: Color.grayDDDDDD, height: 8)
                    .opacity(0.5)
                
                Text("고민글")
                    .applyFont(font: .heading5)
                    .padding(.init(top: 16, leading: 20, bottom: 8, trailing: 0))
                
                CustomCarouselView(pageCount: HomeSample.homeSample.count,
                                   pageSpacing: 20,
                                   edgeSpacing: 12,
                                   cardSpacing: 8) { index in
                    let item = HomeSample.homeSample[index]
                    
                    CarouselContentView(data: item)
                }
            }
            
        }
        .onAppear {
            viewModel.getTodayTopic()
        }
    }
}

#Preview {
    HomeMainPage()
}

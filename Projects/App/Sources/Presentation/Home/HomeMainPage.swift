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
    
    let date = dateFormatter.string(from: Date())
}

struct HomeMainPage: View {
    var body: some View {
        @StateObject var viewModel = HomeMainPageModel()
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Text("\(viewModel.date)")
                        .foregroundColor(.black)
                        .opacity(0.1)
                        .font(.thinkingRegular(80))
                        .padding(.top, 16)
                    
                    VStack(alignment: .leading) {
                        Image("Logo")
                            .padding(.vertical, 16)

                        Text("길어지면 두줄이 되는 오늘의 주제입니다")
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
        
    }
}

#Preview {
    HomeMainPage()
}

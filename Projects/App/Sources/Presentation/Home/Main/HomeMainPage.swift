//
//  HomeMainPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/25.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct HomeMainPage: View {
    @EnvironmentObject var router: Router
    @StateObject private var viewModel = HomeMainPageModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    todayDate()
                    
                    VStack(spacing: 0) {
                        LyfeCommon.ic_logo
                            .frame(maxWidth:. infinity, alignment: .leading)
                            .padding(.vertical, 16)
                        
                        Text("\(viewModel.todayTopic)")
                            .applyFont(font: .heading2)
                            .foregroundStyle(Color.mainE86336)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                        
                        CardSwipeView(viewModel: viewModel)
                        Spacer().frame(height: 32)
                    }
                }
                .padding(.horizontal, 20)
                
                RectangleComponent(color: Color.grayDDDDDD.opacity(0.5), height: 8)
                
                Text("고민글")
                    .applyFont(font: .heading5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.init(top: 16, leading: 20, bottom: 8, trailing: 0))
                
                carousel()
            }
        }
        .onAppear {
            viewModel.getLatestBoard(.board)
            viewModel.getLatestBoard(.board_picture)
            viewModel.getTodayTopic()
        }
        .background(Color.grayF5F5F5)
    }
    
    @ViewBuilder func todayDate() -> some View {
        Text("\(TodayDate.date)")
            .foregroundColor(.black)
            .opacity(0.05)
            .font(.thinkingRegular(80))
            .padding(.top, 16)
    }
    
    @ViewBuilder func carousel() -> some View {
        CarouselSecondView(data: viewModel.feedData,
                           edgeSpacing: 12,
                           contentSpacing: 8,
                           totalSpacing: 20,
                           contentHeight: 154)
        { data in
            Rectangle()
                .fill(Color.gray010_F9F9F9)
                .overlay {
                    CarouselContentView(data: data)
                        .onTapGesture {
                            router.navigateTo(.postDetail)
                        }
                }
                .modifier(CarouselModifier())
            
        } lastContent: {
            Rectangle()
                .fill(Color.gray010_F9F9F9)
                .overlay {
                    NoneCarouselData()
                }
                .modifier(CarouselModifier())
        }
    }
}

struct CarouselModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray200_C6C6C6)
            }
            .shadow(color: .black.opacity(0.1), radius: 10, x: 2, y: 6)
    }
}

#Preview {
    HomeMainPage()
}

//
//  HomeView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/01/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum ContentSequence {
    case latest
    case popular
}

class TodayHomeViewModel: ObservableObject {
    @Published var sequence: ContentSequence = .latest
    @Published var sampleData: HomeSample = HomeSample.sampleUser
    @Published var homeSample: [HomeSample] = HomeSample.homeSample
}

struct TodayHomePage: View {
    @StateObject var todayHomeViewModel = TodayHomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("여름과 가을 사이 \n두줄일 경우는 이렇게")
                .lineSpacing(2)
                .layoutPriority(1)
                .font(.bold(28))
                .foregroundColor(.MainE86336)
            
            CardSwipeView()
                .padding(.bottom, 24)
            
            HStack {
                Text("고민글")
                    .font(.bold(24))
                Spacer()
                SequenceView(todayHomeViewModel: todayHomeViewModel)
            }
            
            LazyVStack {
                ForEach(Array(todayHomeViewModel.homeSample.enumerated()), id: \.offset) { index, value in
                    GeneralPostPage(sampleData: todayHomeViewModel.homeSample[index])
                    Divider()
                        .opacity(index == 4 ? 0 : 1)
                }
                
            }
        }
    }
}

/// 최신순/인기순 선택
struct SequenceView: View {
    @ObservedObject var todayHomeViewModel: TodayHomeViewModel
    
    var body: some View {
        HStack(spacing: 4) {
            Button {
                todayHomeViewModel.sequence = .latest
            } label: {
                Text("최신순")
                    .foregroundColor(todayHomeViewModel.sequence == .latest ? .MainE86336 : .GrayC6C6C6)
                    .font(todayHomeViewModel.sequence == .latest ? .bold(16) : .regular(16))
            }
                
            Text("|")
                .foregroundColor(.GrayC6C6C6)
            
            Button {
                todayHomeViewModel.sequence = .popular
            } label: {
                Text("인기순")
                    .foregroundColor(todayHomeViewModel.sequence == .popular ? .MainE86336 : .GrayC6C6C6)
                    .font(todayHomeViewModel.sequence == .popular ? .bold(16) : .regular(16))
            }
        }
    }
}

#Preview {
    TodayHomePage()
}

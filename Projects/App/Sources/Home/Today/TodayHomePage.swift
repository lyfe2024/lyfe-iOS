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
}

struct TodayHomePage: View {
    @StateObject var todayHomeViewModel = TodayHomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("여름과 가을 사이 \n두줄일 경우는 이렇게")
                .lineSpacing(2)
                .layoutPriority(1)
                .font(.pretendardBold28)
                .foregroundColor(.MainE86336)
            
            CardSwipeView()
                .padding(.bottom, 24)
            
            HStack {
                Text("고민글")
                    .font(.pretendardBold20)
                Spacer()
                SequenceView(todayHomeViewModel: todayHomeViewModel)
            }
            GeneralPostPage(sampleData: todayHomeViewModel.sampleData)
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
                    .font(todayHomeViewModel.sequence == .latest ? .pretendardBold14 : .pretendardRegular14)
            }
                
            Text("|")
                .foregroundColor(.GrayC6C6C6)
            
            Button {
                todayHomeViewModel.sequence = .popular
            } label: {
                Text("인기순")
                    .foregroundColor(todayHomeViewModel.sequence == .popular ? .MainE86336 : .GrayC6C6C6)
                    .font(todayHomeViewModel.sequence == .popular ? .pretendardBold14 : .pretendardRegular14)
            }
        }
    }
}

#Preview {
    TodayHomePage()
}

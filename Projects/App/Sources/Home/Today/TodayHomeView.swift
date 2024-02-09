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
    // 오늘 날짜..?
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd."
        return formatter
    }()
    
    let date = dateFormatter.string(from: Date())
    
    @Published var sequence: ContentSequence = .latest
    @Published var sampleData: HomeSample = HomeSample.sampleUser
}

struct TodayHomeView: View {
    @StateObject var todayHomeViewModel = TodayHomeViewModel()
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topTrailing) {
                Spacer().frame(height: 20)
                Text(todayHomeViewModel.date)
                    .foregroundColor(.black)
                    .opacity(0.1)
                    .font(.thinkRegular80)
                
                VStack(alignment: .leading) {
                    Image("Logo")
                    Spacer().frame(height: 21)
                    
                    Text("오늘의 주제")
                        .font(.pretendardBold14)
                    Spacer().frame(height: 9)
                    
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
                                        
                    TroublePostView(sampleData: todayHomeViewModel.sampleData)
                }
            }
            .padding(20)
        }
        .background(Color.backgroundFf5f5f5)
    }
}

// 홈뷰에 있는 고민글 포스트 뷰
struct TroublePostView: View {
    var sampleData: HomeSample
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                Image(sampleData.image)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                Text(sampleData.userName)
                    .font(.pretendardBold14)
                Text(sampleData.updatedAt)
                    .font(.pretendardRegular10)
                    .foregroundColor(.GrayC6C6C6)
            }

            Text(sampleData.title)
                .font(.custom(CustomFont.bold, size: 16))
            Text(sampleData.content)
                .lineSpacing(1.5)
                .lineLimit(2)
                .font(.pretendardSemiBold14)
            
            HStack(spacing: 16) {
                HStack(spacing: 2) {
                    Image("GrayWine")
                    Text("40")
                }
                
                HStack(spacing: 2) {
                    Image("GrayComment")
                    Text("8")
                }
            }
            .foregroundColor(Color.GrayB0B0B0)
            .font(.pretendardRegular14)
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
    TodayHomeView()
}

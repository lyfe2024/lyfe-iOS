//
//  CardView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum CardValue: String {
    case today = "today"
    case past = "past"
}

struct CardView: View {
    @ObservedObject var cardSwipeViewModel = CardSwipeViewModel()
    var data: HomeSample
    var cardValue: CardValue
    
    var body: some View {
        VStack {
            Group {
                if cardValue == .today {
                    Image("\(data.image)")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    Image("\(data.image)")
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height * 0.55)
                        .frame(width: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .overlay {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack(alignment: .leading) {
                        HStack(spacing: 8) {
                            Image(data.profile)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 32, height: 32)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(data.userName)")
                                    .font(.pretendardBold14)
                                Text("\(data.updatedAt)")
                                    .font(.pretendardRegular10)
                                // 폰트 미적용!!
                            }
                            .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(16)
                        
                        Spacer()
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Image("WhiteWine")
                                Text("\(data.whisky)")
                                // 폰트 미적용
                            }
                            Text("\(data.title)")
                                .lineLimit(2)
                                .font(.pretendardBold20)
                            
                        }
                        .padding(10)
                        .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    CardView(data: HomeSample.homeSample[0], cardValue: CardValue.today)
}

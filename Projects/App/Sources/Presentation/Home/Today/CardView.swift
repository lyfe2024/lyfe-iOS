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
                        .frame(height: UIScreen.main.bounds.height * 0.55)
                        .scaledToFit()
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
                                    .font(.bold(16))
                                Text("\(data.updatedAt)")
                                    .font(.regular(12))
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
                            }
                            Text("\(data.title)")
                                .lineLimit(2)
                                .font(.bold(22))
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
    CardView(data: HomeSample.homeSample[1], cardValue: CardValue.today)
}

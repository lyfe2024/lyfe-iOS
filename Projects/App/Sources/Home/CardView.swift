//
//  CardView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var cardSwipeViewModel = CardSwipeViewModel()
    var data: HomeSample
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("\(data.image)")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    ZStack {
                        Color.black
                            .opacity(0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Image(data.userImage)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                    .padding(16)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("\(data.user)")
                                    Text("\(data.time)")
                                }
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Image("Wine")
                                    Text("\(data.whisky)")
                                    // 글씨 미적용
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
    CardView(data: HomeSample.homeSample[0])
}

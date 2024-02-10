//
//  PastPostView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct PastPostView: View {
    var sampleData: HomeSample
    
    var body: some View {
        ZStack {
            Color.GrayF5F5F5
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("여기에 과거 주제 \n내용 문장 들어갑니다.")
                    .font(.pretendardBold20)
                    .lineSpacing(4)
                    .lineLimit(2)
                
                HStack {
                    CardView(data: HomeSample.sampleUser, cardValue: .past)
                }
            }
            .padding(16)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    PastPostView(sampleData: HomeSample.sampleUser)
}

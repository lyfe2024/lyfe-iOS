//
//  NoneCarouselData.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/16.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct NoneCarouselData: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("함께 더 많은 고민을 나눠봐요!")
                .applyFont(font: .title3)
                .frame(maxWidth: .infinity)
            
            Text("더보기")
                .padding(.init(top: 4,leading: 24,bottom: 4,trailing: 24))
                .background(Color.mainE86336)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(Color.white)
                .applyFont(font: .body1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.clear)
    }
}

#Preview {
    NoneCarouselData()
}

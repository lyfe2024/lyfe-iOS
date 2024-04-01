//
//  AddCardView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct AddCardView: View {
    var height = UIScreen.main.bounds.height * 0.5 // 사진 높이
    var width = UIScreen.main.bounds.width * 0.8 // 사진 높이
    @StateObject var cardSwipeViewModel = CardSwipeViewModel()
    let colorArray: [Color] = [.GrayF9F9F9,.GrayDDDDDD,  .GrayC6C6C6, .GrayB0B0B0]
    
    var body: some View {
        ZStack {
            ForEach(colorArray, id: \.self) { index in
                Rectangle()
                    .fill(index)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        
        VStack {
            GeometryReader { proxy in
                let size = proxy.size
                let trailCardsToShown: CGFloat = 2
                let trailingSpacesofEachCards: CGFloat = 20
            }
        }
    }
}

#Preview {
    AddCardView()
}

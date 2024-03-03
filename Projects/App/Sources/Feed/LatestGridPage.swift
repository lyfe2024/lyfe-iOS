//
//  LatestGridPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/03.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

/*
 struct BadgeView: View {
     @ObservedObject var mypageViewModel: MypageViewModel
     private let colums: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
     var body: some View {
         VStack {
             if mypageViewModel.itemRatios.isEmpty {
                 BadgeLottieView()
             } else {
                 LazyVGrid(columns: colums, spacing: 12) {
                     ForEach(mypageViewModel.itemRatios.sorted(by: { $0.key > $1.key })
                         .sorted(by: { $0.value > $1.value })
                         .prefix(10), id: \.key) { item, ratio in
                         BadgePhotoView(mypageViewModel: mypageViewModel, item: item, ratio: ratio)
                     }
                     .padding(.horizontal, 3)
                 }
                 .padding(.horizontal, 15)
                 .font(ZenoFontFamily.NanumSquareNeoOTF.regular.swiftUIFont(size: 14))
                 .foregroundColor(.primary)
             }
         }
     }
 }
 */

struct LatestGridPage: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LatestGridPage()
}

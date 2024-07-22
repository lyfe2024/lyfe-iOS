//
//  NonePhotoDataView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/22.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct NonePhotoDataView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
                .frame(height: 144)
            Text("신청한 사진이 없네요.\n사진을 신청하러 가볼까요?")
                .applyFont(font: .title1)
                .multilineTextAlignment(.center)
            CommonButton(title: "사진 신청하러 가기")
                .frame(width: 167)
            Spacer()
        }
    }
}

#Preview {
    NonePhotoDataView()
}

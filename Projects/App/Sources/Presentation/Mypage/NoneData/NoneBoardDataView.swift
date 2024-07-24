//
//  NoneBoardDataView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/22.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct NoneBoardDataView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
                .frame(height: 144)
            Text("고민을 털어놓으면 마음이 가벼워져요.\n첫 번째 글을 작성해 보세요.")
                .applyFont(font: .title1)
                .multilineTextAlignment(.center)
            CommonButton(title: "고민글 쓰러가기")
                .frame(width: 167)
            Spacer()
        }
    }
}

#Preview {
    NoneBoardDataView()
}

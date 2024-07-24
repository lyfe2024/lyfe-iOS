//
//  NoneUserSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/03.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct NoneUserSettingPage: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("설정")
                .font(.bold(24))
                .padding(.vertical, 6)
                .padding(.bottom, 16)
            
            SettingHStackView(text: "이용약관",image: LyfeCommon.ic_gray_arrow_after)
            SettingHStackView(text: "개인정보 수집 및 이용", image: LyfeCommon.ic_gray_arrow_after)
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
}

#Preview {
    NavigationStack {
        NoneUserSettingPage()
    }
}

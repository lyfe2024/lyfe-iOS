//
//  DesignSystemTest.swift
//  DesignSystem
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct DesignSystemTest: View {
    var body: some View {
        VStack {
            Text("Font Test")
                .applyFont(font: .heading1)
            
            Image("\(DesignSystemAsset.icHome.name)")
                .padding(30)
                .background(Color.mainFFD0BB)
                .foregroundStyle(Color.black)
            
            LyfeTab.ic_home
                .background(.red)
            LyfeTab.ic_home_fill
                .background(.yellow)
            
            LyfeCommon.ic_black_arrow_back
            LyfeCommon.ic_alarm_notification
        }
    }
}

#Preview {
    DesignSystemTest()
}

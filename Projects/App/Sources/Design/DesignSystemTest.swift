//
//  DesignSystemTest.swift
//  Lyfe
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct DesignSystemTest: View {
    @State private var isShowing: Bool = false
    @State private var isShowingTest: Bool = false
    private var testIcon: TabInfo = .alarm
    
    let title: String = "로그인"
    let desc: String = "반응을 남기려면 로그인이 필요해요"
    let firstButton: String = "확인"
    
    var body: some View {
        ZStack {
            Color.mainFFD0BB
                .ignoresSafeArea()
            
            VStack {
                Text("isShowing")
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                Text("isShowingTest")
                    .onTapGesture {
                        isShowingTest.toggle()
                    }
                
                LyfeTab.ic_home
                    .padding(10)
                    .background(Color.yellow)
                LyfeTab.ic_home_fill
            }
        }
        .customAlert(isShowing: $isShowing,
                     type: .firstButton(title: firstButton),
                     title: title,
                     desc: desc,
                     confirmButton: {
            isShowing.toggle()
        })
        
        .customAlert(isShowing: $isShowingTest,
                     type: .doubleButton(leftTitle: "취소", rightTitle: "확인"),
                     title: "모달 타이틀", desc: "") {
            isShowingTest.toggle()
        } cancelButton: {
            isShowingTest.toggle()
        }
    }
}

#Preview {
    DesignSystemTest()
}

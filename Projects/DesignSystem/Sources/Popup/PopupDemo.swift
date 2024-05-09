//
//  PopupDemo.swift
//  DesignSystem
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct PopupDemo: View {
    @State private var isShowing: Bool = false
    @State private var isShowingTest: Bool = false
    
    let title: String = "로그인"
    let desc: String = "반응을 남기려면 로그인이 필요해요"
    let firstButton: String = "확인"
    
    var body: some View {
        ZStack {
            Color.yellow
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
    PopupDemo()
}

//
//  NoneUserPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct NoneUserPage: View {
    var body: some View {
        VStack {
            Spacer()
            Text("로그인 하시면 신청한 사진,\n작성한 고민글을 모아 볼 수 있어요")
                .multilineTextAlignment(.center)
                .font(.bold(18))
                .padding(.vertical, 5)
                .foregroundColor(.Gray393939)
            
            Spacer().frame(height: 40)
            
            CommonButton(title: "로그인하러 가기")
                .tap {
                    print("loging button tapped!")
                }
                .padding(.horizontal, 82)
            
            Spacer().frame(height: 8)
            
            Text("아직 회원이 아니신가요?")
                .foregroundStyle(Color.GrayB0B0B0)
                .font(.medium(14))
            Spacer()
        }
    }
}

#Preview {
    NoneUserPage()
}

//
//  UserSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct UserSettingPage: View {
    @State private var userExperience: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("설정")
                .font(.bold(24))
            
            Text("알림 설정")
            
            Button {
                userExperience.toggle()
            } label: {
                Text("사용경험")
                    .navigationDestination(isPresented: $userExperience) {
                        UserExperiencePage()
                    }
            }
            
            
            // TODO: 회원가입 페이지 붙여넣기
            Text("개인정보처리방침")
            Text("회원탈퇴")
        }
        .font(.medium(16))
    }
}

#Preview {
    NavigationStack {
        UserSettingPage()
    }
}

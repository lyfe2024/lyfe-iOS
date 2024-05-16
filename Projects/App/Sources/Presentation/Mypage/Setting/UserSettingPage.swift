//
//  UserSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class UserSettingPageModel: ObservableObject {
    @Published var termAndConditions: Bool = false
    @Published var settingToggle: Bool = false
    @Published var logoutStatues: Bool = false
}

struct UserSettingPage: View {
    @StateObject var userSettingViewModel = UserSettingPageModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("설정")
                .font(.bold(24))
                .padding(.vertical, 6)
                .padding(.bottom, 16)
            
            Toggle(isOn: $userSettingViewModel.settingToggle) {
                Text("알림 설정")
                    .font(.medium(16))
                    .padding(.vertical, 4)
                    .padding(.vertical, 12)
            }
            .tint(Color.MainE86336)
            
            SettingHStackView(text: "사용경험", image: "ic_round-navigate-next")
            SettingHStackView(text: "이용약관", image: "ic_round-navigate-next")
            SettingHStackView(text: "개인정보 수집 및 이용", image: "ic_round-navigate-next")
            SettingHStackView(text: "회원탈퇴", image: "ic_round-navigate-next")
            
            Spacer()
            CommonButton(title: "로그아웃")
                .enable(false)
                .tap {
                    print("logout 진행")
                }
            
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
}

struct SettingHStackView: View {
    
    var text: String
    var image: String
    
    var body: some View {
        HStack {
            Text(text)
               
            Spacer()
            Image(image)
        }
        .font(.medium(16))
        .padding(.vertical, 8)
        .padding(.vertical, 12)
    }
}

#Preview {
    NavigationStack {
        UserSettingPage()
    }
}

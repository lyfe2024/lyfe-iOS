//
//  UserSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

class UserSettingPageModel: ObservableObject {
    private let authNetworkService = AuthNetwork()
    
    @Published var termAndConditions: Bool = false
    @Published var settingToggle: Bool = false
    
    func revoke(completion: @escaping () -> Void) {
        authNetworkService
            .revoke { result in
                switch result {
                case .success:
                    AccountStorage.shared.reset()
                    completion()
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    return
                }
            }
    }
}

struct UserSettingPage: View {
    @StateObject var userSettingViewModel = UserSettingPageModel()
    @EnvironmentObject var router: Router
    @State var isShowingLogoutAlert: Bool = false
    
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
                .enable(!AccountStorage.shared.isGuest)
                .tap {
                    isShowingLogoutAlert = true
                }
            
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
        .customAlert(
            isShowing: $isShowingLogoutAlert,
            type: .doubleButton(leftTitle: "아니오", rightTitle: "예"),
            title: "로그아웃 하시겠어요?",
            desc: ""
        ) {
            userSettingViewModel.revoke {
                debugPrint("logout 완료")
            }
            isShowingLogoutAlert.toggle()
        } cancelButton: {
            isShowingLogoutAlert.toggle()
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

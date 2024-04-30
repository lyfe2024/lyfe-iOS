//
//  NoneUserSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class NoneUserSettingPageModel: ObservableObject {
    @Published var termAndConditions: Bool = false
    @Published var settingToggle: Bool = false
    
    
}

struct NoneUserSettingPage: View {
    @StateObject var noneUserSettingViewModel = NoneUserSettingPageModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("설정")
                .font(.bold(24))
                .padding(.vertical, 12)
                .padding(.bottom, 16)
            Toggle(isOn: $noneUserSettingViewModel.settingToggle) {
                Text("알림 설정")
                    .font(.medium(16))
                    .padding(.vertical, 8)
                    .padding(.vertical, 12)
            }
            .tint(Color.MainE86336)
            
            SettingHStackView(text: "사용경험", image: "ic_round-navigate-next")
            SettingHStackView(text: "이용약관", image: "ic_round-navigate-next")
            SettingHStackView(text: "개인정보 수집 및 이용", image: "ic_round-navigate-next")
            SettingHStackView(text: "회원탈퇴", image: "ic_round-navigate-next")
            
            Spacer()
            Button {
                print("로그아웃 임시 버튼 tapped")
            } label: {
                Text("피드백 보내기 임시버튼")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
                    .background(Color.Gray363636)
                    .font(.semiBold(16))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.vertical, 8)
            }
            .padding(.bottom, 24)
        }
        .padding(.horizontal, 20)
    }
}

struct SettingHStackView: View {
    
    var text: String
    var image: String
    
    var body: some View {
        // TODO: 회원가입 페이지 붙여넣기
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
    NoneUserSettingPage()
}

//
//  UserProfileSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct UserProfileSettingPage: View {
    var body: some View {
        VStack {
            Text("프로필 수정")
                .font(.bold(24))
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Sample1")
                .resizable()
                .frame(width: 80, height: 80)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        
                    } label: {
                        // TODO: 이미지 시스템 버튼으로 수정
                        Image("mainColor_PlusButton")
                    }
                }
        }
    }
}

#Preview {
    UserProfileSettingPage()
}

//
//  UserProfileSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

final class UserProfileSettingPageModel: ObservableObject {
    @Published var sampleData = HomeSample.sampleUser
}

struct UserProfileSettingPage: View {
    @EnvironmentObject var router: Router
    @StateObject var userProfileSettingPageModel = UserProfileSettingPageModel()
    @State var nicknameDummy = ""
    
    var body: some View {
        VStack {
            Text("프로필 수정")
                .font(.bold(24))
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 24)
            
            ZStack(alignment: .bottomTrailing) {
                Image("\(userProfileSettingPageModel.sampleData.image)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Button {
                    print("프로필 수정 버튼 tapped")
                } label: {
                    Image("mainColor_PlusButton")
                        .alignmentGuide(.bottom, computeValue: { dimension in
                            dimension[.bottom] * 0.8
                        })
                        .alignmentGuide(.trailing, computeValue: { dimension in
                            dimension[.bottom] * 0.7
                        })
                }
            }
            
            Spacer().frame(height: 32)
            
            TextInput(text: $nicknameDummy) // 닉네임관련 수정 후 반영..
            Spacer()
            CommonButton(title: "완료")
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
}

#Preview {
    NavigationStack {
        UserProfileSettingPage()
    }
}

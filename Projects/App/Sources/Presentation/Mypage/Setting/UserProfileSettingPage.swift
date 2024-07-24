//
//  UserProfileSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher

struct UserProfileSettingPage: View {
    @EnvironmentObject var router: Router
    let profileImage: String
    let userName: String
    @State var nickname = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Text("프로필 수정")
                .applyFont(font: .heading3)
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity, alignment: .leading)

            
            ZStack(alignment: .bottomTrailing) {
                KFImage(URL(string: profileImage))
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
            
            TextInput(text: $nickname) // 닉네임관련 수정 후 반영..
            Spacer()
            CommonButton(title: "완료")
        }
        .padding(.horizontal, 20)
        .LyfeNaivigationLButton(LyfeCommon.ic_black_arrow_back) {
            router.navigateBack()
        }
        .onAppear {
            nickname = userName
        }
    }
}

#Preview {
    UserProfileSettingPage(profileImage: "", userName: "sample")
}

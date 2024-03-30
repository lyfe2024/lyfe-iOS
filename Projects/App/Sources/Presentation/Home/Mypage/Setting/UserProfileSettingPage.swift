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
    @StateObject var userProfileSettingPageModel = UserProfileSettingPageModel()
    
    var body: some View {
        VStack {
            Text("프로필 수정")
                .font(.bold(24))
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .bottomTrailing) {
                Image("\(userProfileSettingPageModel.sampleData.image)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Image("mainColor_PlusButton")
                    .frame(alignment: .bottomTrailing)
                
            }
        }
    }
}

#Preview {
    UserProfileSettingPage()
}

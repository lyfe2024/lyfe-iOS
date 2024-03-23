//
//  LoginMainPage.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct LoginMainPage: View {
    var body: some View {
        ZStack {
            Color.backgroundFf5f5f5
            
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 157.16, height: 60)
                
                Spacer()
                    .frame(height: 168)
                
                VStack(spacing: 12) {
                    ForEach(Login.allCases, id: \.self) { type in
                        LoginButton(type: type)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginMainPage()
}

//
//  LoginMainPage.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

final class LoginMainPageModel: ObservableObject {
    private let authNetwork = AuthNetwork()
    private let kakaoLoginManager = KakaoLoginManager()
    
    func kakaoLogin(completion: @escaping (String?) -> Void) {
        kakaoLoginManager.login() { [weak self] token in
            self?.authNetwork
                .kakaoLogin(token) { result in
                    switch result {
                    case .success(let data):
                        if let userToken = data.userToken {
                            completion(userToken)
                        } else if let accessToken = data.accessToken,
                                  let refreshToken = data.refreshToken {
                            AccountStorage.shared.accessToken = accessToken
                            AccountStorage.shared.refreshToken = refreshToken
                            completion(nil)
                        }
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                        return
                    }
                }
        }
    }
    
    func appleLogin() {
        
    }
    
    func googleLogin() {
        
    }
}

struct LoginMainPage: View {
    @StateObject var viewModel = LoginMainPageModel()
    @EnvironmentObject var router: Router
    
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
                            .onTapGesture {
                                switch type {
                                case .kakao:
                                    viewModel.kakaoLogin() { token in
                                        if let token = token {
                                            router.navigateTo(.nickname(token))
                                        } else {
                                            router.replaceNavigationStack(.tabView)
                                        }
                                    }
                                case .apple:
                                    viewModel.googleLogin()
                                case .google:
                                    viewModel.appleLogin()
                                }
                            }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginMainPage()
}

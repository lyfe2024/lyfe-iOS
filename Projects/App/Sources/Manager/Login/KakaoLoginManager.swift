//
//  KakaoLoginManager.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class KakaoLoginManager {
    func login(completion: @escaping (String) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    debugPrint(error)
                }
                else {
                    debugPrint("loginWithKakaoTalk() success.")
                    guard let token = oauthToken?.accessToken else {
                        debugPrint("token error")
                        return
                    }
                    completion(token)
                }
            }
        }
    }
}

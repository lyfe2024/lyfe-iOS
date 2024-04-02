//
//  LyfeApp.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/01/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct LyfeApp: App {
    @State var test: String = "선택1"
    
    init() {
        if let kakaoApiKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_API_KEY") as? String {
            KakaoSDK.initSDK(appKey: kakaoApiKey)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView {
                TabBarMainPage()
            }
            .onOpenURL(perform: { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    print(AuthController.handleOpenUrl(url: url))
                }
            })
        }
        
    }
}

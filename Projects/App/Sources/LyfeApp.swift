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
        KakaoSDK.initSDK(appKey: "16a28ff83fdcfecd2f4a6b6e8962aa6d")
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView {
                LoginMainPage()
            }
            .onOpenURL(perform: { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    print(AuthController.handleOpenUrl(url: url))
                }
            })
        }
        
    }
}

//
//  TabInfo.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/01.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum TabInfo: CaseIterable {
    case home, feed, post, alarm, profile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            TodayHomePage()
        case .feed:
            Text("feed")
        case .post:
            Text("post")
        case .alarm:
            Text("alarm")
        case .profile:
//            Text("profile")
            LoginMainScreen()
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .feed:
            return "피드"
        case .post:
            return "게시"
        case .alarm:
            return "알림"
        case .profile:
            return "프로필"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "Home"
        case .feed:
            return "Feed"
        case .post:
            return "Post"
        case .alarm:
            return "Alarm"
        case .profile:
            return "Profile"
        }
    }
}

//
//  TabInfo.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/01.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

enum TabInfo: CaseIterable {
    case home, feed, post, alarm, profile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeMainPage()
        case .feed:
            PhotoFeedDetailPage()
        case .post:
            Text("post")
        case .alarm:
            Text("alarm")
        case .profile:
            MypageMainPage()
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
    
    var image: Image {
        switch self {
        case .home:
            return LyfeTab.ic_home
        case .feed:
            return LyfeTab.ic_album
        case .post:
            return LyfeTab.ic_add_circle
        case .alarm:
            return LyfeTab.ic_alarm
        case .profile:
            return LyfeTab.ic_user
        }
    }
    
    var image_fill: Image {
        switch self {
        case .home:
            return LyfeTab.ic_home_fill
        case .feed:
            return LyfeTab.ic_album_fill
        case .post:
            return LyfeTab.ic_add_circle_fill
        case .alarm:
            return LyfeTab.ic_alarm_fill
        case .profile:
            return LyfeTab.ic_user_fill
        }
    }
}

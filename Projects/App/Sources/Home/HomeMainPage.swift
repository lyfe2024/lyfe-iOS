//
//  HomeMainView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct HomeMainPage: View {
    @State private var postType: HomePicker = .today
    
    var body: some View {
        VStack {
            switch postType {
            case .today:
                TodayHomePage()
            case .past:
                PastPostPage()
            }
        }
    }
}

#Preview {
    HomeMainPage()
}

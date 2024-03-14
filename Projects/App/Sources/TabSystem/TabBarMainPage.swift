//
//  TabBarMainView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/01.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct TabBarMainPage: View {
    @StateObject private var tabBarViewModel = TabBarViewModel()
    
    var body: some View {
        TabView(selection: $tabBarViewModel.selected) {
            ForEach(TabInfo.allCases, id: \.self) { tab in
                tab.view
            }
            .toolbarBackground(.hidden, for: .tabBar)
        }
        .overlay {
            VStack {
                Spacer()
                CustomTabBarPage(tabBarViewModel: tabBarViewModel)
            }
        }
    }
}

#Preview {
    TabBarMainPage()
}

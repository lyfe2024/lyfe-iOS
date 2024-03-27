//
//  Router.swift
//  Lyfe
//
//  Created by 고세림 on 3/28/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable, Identifiable {
        var id: Self { self }
        
        case tabView
        case login
        case nickname(String)
    }
    
    // Used to programatically control our navigation stack
    @Published var path: NavigationPath = NavigationPath()
    
    // Builds the views
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .tabView:
            TabBarMainPage()
        case .login:
            LoginMainPage()
        case .nickname:
            NicknamePage()
        }
    }
    
    func navigateTo(_ page: Route) {
        path.append(page)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func replaceNavigationStack(_ page: Route) {
        path.removeLast(path.count)
        path.append(page)
    }
}

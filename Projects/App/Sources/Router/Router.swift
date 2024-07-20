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
        case term(String, String)
        case termDetail(String, String, String)
        case postPhoto
        case postText
        case mypage
        case setting
        case userExperience
        case postDetail
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
        case .nickname(let token):
            let viewModel = NicknamePageModel(token: token)
            NicknamePage(viewModel: viewModel)
        case .term(let token, let nickname):
            let viewModel = TermPageModel(token: token, nickname: nickname)
            TermPage(viewModel: viewModel)
        case .termDetail(let icon, let title, let content):
            let viewModel = TermDetailPageModel(icon: icon, title: title, content: content)
            TermDetailPage(viewModel: viewModel)
        case .postPhoto:
            let viewModel = PostPhotoPageModel()
            PostPhotoPage(viewModel: viewModel)
        case .postText:
            let viewModel = PostTextPageModel()
            PostTextPage(viewModel: viewModel)
        case .mypage:
            MypageMainPage()
        case .setting:
            UserSettingPage()
        case .userExperience:
            UserExperiencePage()
        case .postDetail:
            ContentFeedDetailPage()
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

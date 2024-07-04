//
//  RouterView.swift
//  Lyfe
//
//  Created by 고세림 on 3/28/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct RouterView<Content: View>: View {
    @StateObject var router: Router = Router()
    @StateObject var toastPresenter = ToastPresenter.shared
    @State private var showToast: Bool = false

    private let content: Content
    private let logoutPublisher = Notification.needToLogIn.publisher
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                
            }
            .navigationDestination(for: Router.Route.self) { route in
                router.view(for: route)
            }
            .onAppear {
                router.navigateTo(.tabView)
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .onReceive(logoutPublisher) { _ in
            router.navigateTo(.login)
        }
        .showToast(toastPresenter.text, show: $toastPresenter.isPresented)
        .environmentObject(router)
        .environmentObject(toastPresenter)
    }
}

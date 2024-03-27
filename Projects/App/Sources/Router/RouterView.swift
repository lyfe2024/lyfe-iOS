//
//  RouterView.swift
//  Lyfe
//
//  Created by 고세림 on 3/28/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router: Router = Router()
    private let content: Content
    
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
                router.navigateTo(.login)
            }
        }
        .environmentObject(router)
    }
}

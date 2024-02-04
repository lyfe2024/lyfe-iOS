//
//  LyfeApp.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/01/25.
//

import SwiftUI

@main
struct LyfeApp: App {
    var body: some Scene {
        WindowGroup {
            RouteScreen(TestNaviItem.self, rootType: .aaa)
        }
    }
}

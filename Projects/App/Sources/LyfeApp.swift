//
//  LyfeApp.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/01/25.
//

import SwiftUI

@main
struct LyfeApp: App {
    @State var test: String = "선택1"
    var body: some Scene {
        WindowGroup {
            TabBarMainPage()
        }
    }
}

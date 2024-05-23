//
//  TermDetailPage.swift
//  Lyfe
//
//  Created by 고세림 on 5/23/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine

final class TermDetailPageModel: ObservableObject {
    private let networkService = PolicyNetwork()
    private let type: Term
    
    let title: String
    let content: String
    
    init(type: Term, title: String, content: String) {
        self.type = type
        self.title = title
        self.content = content
    }
}

struct TermDetailPage: View {
    @ObservedObject var viewModel: TermDetailPageModel
    @EnvironmentObject var router: Router
    
    init(viewModel: TermDetailPageModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("")
        }
        .navigationBackButton {
            router.navigateBack()
        }
    }
}

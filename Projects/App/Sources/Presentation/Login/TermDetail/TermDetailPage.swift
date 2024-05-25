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
    
    let icon: String
    let title: String
    let content: String
    
    init(icon: String, title: String, content: String) {
        self.icon = icon
        self.title = title
        self.content = content
    }
}

struct TermDetailPage: View {
    @ObservedObject var viewModel: TermDetailPageModel
    @EnvironmentObject var router: Router
    
    var attributedString: AttributedString?
    
    init(viewModel: TermDetailPageModel) {
        self.viewModel = viewModel
        do {
            try self.attributedString = AttributedString(styledMarkdown: viewModel.content)
        } catch {
            
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 36)
                
                Text(viewModel.icon)
                    .font(.system(size: 60))
                
                Spacer()
                    .frame(height: 16)
                
                Text(attributedString ?? "")
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
        }
        .navigationBackButtonWithTitle(title: titleView) {
            router.navigateBack()
        }
    }
    
    var titleView: Text {
        return Text(viewModel.title)
    }
}

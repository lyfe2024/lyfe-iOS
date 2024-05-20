//
//  TabView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/01.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Combine


final class TabBarViewModel: ObservableObject {
    @Published var selected: TabInfo = .home
    @Published var defaultTab: TabInfo = .home
    
    private var cancellables = [AnyCancellable]()

    init() {
        $selected
            .sink { [weak self] selectedTab in
                guard selectedTab != .post else { return }
                self?.defaultTab = selectedTab
            }
            .store(in: &cancellables)
    }
    
    func shouldShowImage(for tab: TabInfo) -> Bool {
        return self.selected == tab
    }
}

struct CustomTabBarPage: View {
    @ObservedObject var viewModel = TabBarViewModel()
    
    var body: some View {
        HStack {
            ForEach(TabInfo.allCases, id: \.self) { item in
                Spacer()

                Button {
                    viewModel.selected = item
                } label: {
                    if viewModel.selected == item {
                        item.image_fill
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.mainE86336)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        item.image
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                    }
                }
                .onTapGesture {
                    viewModel.selected = item
                }

                Spacer()
            }
        }

        .padding(.vertical, 10)
        .background(Color.gray393939)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomTabBarPage(viewModel: TabBarViewModel())
}

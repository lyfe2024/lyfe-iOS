//
//  TabView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/01.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
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
    @ObservedObject var tabBarViewModel = TabBarViewModel()
    
    var body: some View {
        HStack {
            ForEach(TabInfo.allCases, id: \.self) { item in
                Spacer()

                Button {
                    tabBarViewModel.selected = item
                    print(item.image)
                } label: {
                    
                    Image("\(item.image)Fill")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(tabBarViewModel.shouldShowImage(for: item) ? Color.MainE86336 : .clear)
                        .clipShape(tabBarViewModel.shouldShowImage(for: item) ? RoundedRectangle(cornerRadius: 12) : RoundedRectangle(cornerRadius: 0))
                }
                .onTapGesture {
                    tabBarViewModel.selected = item
                }

                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(Color.Gray393939)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomTabBarPage(tabBarViewModel: TabBarViewModel())
}

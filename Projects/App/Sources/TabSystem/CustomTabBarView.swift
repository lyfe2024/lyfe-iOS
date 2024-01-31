//
//  TabView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/01.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {
    @Published var selected: TabInfo = .home
}

struct CustomTabBarView: View {
    @ObservedObject var tabBarViewModel = TabBarViewModel()
    
    var body: some View {
        HStack {
            ForEach(TabInfo.allCases, id: \.self) { item in
                Spacer()

                Button {
                    tabBarViewModel.selected = item
                } label: {
                    if shouldShowImage(for: item) {
                        HStack(spacing: 4) {
                            Image(item.image)
                            Text(item.title)
                                .font(.pretendardBold12)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 12)
                        .padding(.vertical, 6)
                        .background(Color.MainE86336)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    } else {
                        Image(item.image)
                            .frame(width: 24, height: 24)
                    }
                }
                .onTapGesture {
                    tabBarViewModel.selected = item
                }

                Spacer()
            }
        }
        .padding(.vertical, 11)
        .background(Color.Gray393939)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
    }

    private func shouldShowImage(for tab: TabInfo) -> Bool {
        return tabBarViewModel.selected == tab
    }

}

#Preview {
    CustomTabBarView(tabBarViewModel: TabBarViewModel())
}

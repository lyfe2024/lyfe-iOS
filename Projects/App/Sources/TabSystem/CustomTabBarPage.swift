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
                    if tabBarViewModel.shouldShowImage(for: item) {
                        HStack(spacing: 8) {
                            Image("\(item.image)Fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(item.title)
                                .font(.bold(12))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 13)
                        .padding(.trailing, 15)
                        .padding(.vertical, 10)
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
}

#Preview {
    CustomTabBarPage(tabBarViewModel: TabBarViewModel())
}

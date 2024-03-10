//
//  PopularGridPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum FeedPicker: String, CaseIterable {
    case whiskey = "위스키 많은 순"
    case comment = "댓글 많은 순"
}

struct PopularGridPage: View {
    @ObservedObject var gridSectionModel: FeedGridSectionModel
    @State private var selected: FeedPicker = .whiskey
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker("주제 선택", selection: $selected) {
                ForEach(FeedPicker.allCases, id: \.self) { selected in
                    Text(selected.rawValue)
                        .tag(selected)
                }
            }
            .tint(Color.black)
            
            switch selected {
            case .whiskey:
                WhiskeyGridPage()
            case .comment:
                CommentGirdPage()
            }
        }
        .animation(.easeIn, value: selected)
    }
}

#Preview {
    PopularGridPage(gridSectionModel: FeedGridSectionModel())
}

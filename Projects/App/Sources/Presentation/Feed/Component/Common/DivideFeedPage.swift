//
//  DivideFeedPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/08.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

enum FeedType: String, CaseIterable {
    case board_picture = "신청사진"
    case board = "고민글"
    
    var boardType: String {
        switch self {
        case .board_picture:
            "BOARD_PICTURE"
        case .board:
            "BOARD"
        }
    }
}

struct DivideFeedPage: View {
    @ObservedObject var viewModel: FeedGridSectionModel
    
    var body: some View {
        HStack {
            ForEach(FeedType.allCases, id: \.self) { type in
                VStack(spacing: 0) {
                    Text("\(type.rawValue)")
                        .foregroundStyle(viewModel.feedType == type ? Color.mainE86336 : Color.grayC6C6C6)
                        .applyFont(font: .heading5)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 5)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(viewModel.feedType == type ? Color.mainE86336 : .clear)
                }
                .onTapGesture {
                    viewModel.tapSection(type)
                }
                .animation(.easeInOut, value: viewModel.feedType)
            }
        }
    }
}

#Preview {
    DivideFeedPage(viewModel: FeedGridSectionModel())
}

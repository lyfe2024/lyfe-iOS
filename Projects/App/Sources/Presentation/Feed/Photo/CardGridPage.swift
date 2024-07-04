//
//  LatestGridPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/03.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine
import Kingfisher

struct CardGridPage: View {
    @ObservedObject var viewModel: FeedGridSectionModel
    private let colums: [GridItem] = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
//        ScrollView {
            LazyVGrid(columns: colums, spacing: 12, content: {
                ForEach(viewModel.feedData, id: \.id) { index in
                    GirdCardComponent(data: index)
                }
            })
//        }
        .onChange(of: viewModel.feedPicker) { newValue in
            viewModel.feedPicker = newValue
            if viewModel.feedPicker == .latest {
                viewModel.getLatestBoard(.board_picture)
            }
        }
        .onAppear {
            viewModel.getPopularBoard(.board_picture)
        }
    }
}

#Preview {
    CardGridPage(viewModel: FeedGridSectionModel())
}

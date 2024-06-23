//
//  PopularGridPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher

struct FeedWritingPage: View {
    @ObservedObject var viewModel: FeedGridSectionModel
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.feedData, id: \.id) { data in
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        KFImage(URL(string: data.imageUrl  ?? ""))
                            .resizable()
                            .frame(width: 24, height: 24)
                            .clipShape(Circle())
                        Text(data.title ?? "")
                            .applyFont(font: .title3)
                        Text(data.updateAt ?? "")
                            .applyFont(font: .caption4)
                            .foregroundStyle(Color.grayB0B0B0)
                    }
                    
                    Text(PublicSample.title)
                        .applyFont(font: .title2)
                    Text(PublicSample.content)
                        .applyFont(font: .body3)
                        .lineLimit(2)
                    
                    HStack(spacing: 8) {
                        HStack(spacing: 2) {
                            LyfeCommon.ic_gray_whisky_empty
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("\(data.whiskyCount ?? 0)")
                        }
                        
                        HStack(spacing: 2) {
                            LyfeCommon.ic_gray_comment
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("\(data.commentCount ?? 0)")
                        }
                    }
                    .foregroundColor(.GrayB0B0B0)
                    .applyFont(font: .caption3)
                }
                .padding(.vertical, 8)
            }
        }
        .onChange(of: viewModel.feedPicker) { newValue in
            viewModel.feedPicker = newValue
            if viewModel.feedPicker == .latest {
                viewModel.getLatestBoard(.writing)
            }
        }
        .onAppear {
            viewModel.getPopularBoard(.writing)
        }
    }
}

#Preview {
    FeedWritingPage(viewModel: FeedGridSectionModel())
}

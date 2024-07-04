//
//  GridSectionPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine

enum FeedPicker: String, CaseIterable {
    case whiskey = "위스키 많은 순"
    case comment = "댓글 많은 순"
    case latest = "최신순"
    
    var feedPicker: String {
        switch self {
        case .whiskey:
            "WHISKY"
        case .comment:
            "COMMENT"
        case .latest:
            "LATEST"
        }
    }
}

class FeedGridSectionModel: ObservableObject {
    @Published var feedType: FeedType = .board
    @Published var feedPicker: FeedPicker = .whiskey
    @Published var feedData: [BoardResponseDTO] = []
    
    let network = BoardNetwork()
    
    func tapSection(_ choice: FeedType) {
        self.feedType = choice
    }
    
    @MainActor
    func getLatestBoard(_ boardType: FeedType) {
        let todayDate = FeedGridSectionModel.dateFormatter.string(from: Date())
        network.getLatestBoard("0", boardType.boardType, todayDate) { result in
            switch result {
            case .success(let success):
                self.feedData = success.list
            case .failure(let failure):
                print("Latest List failure! \(failure.localizedDescription)")
            }
        }
    }
    
    @MainActor
    func getPopularBoard(_ boardType: FeedType) {
        network.getPopularBoard("0", boardType.boardType, feedPicker.feedPicker) { result in
            switch result {
            case .success(let success):
                self.feedData = success.list
            case .failure(let failure):
                print("Popular List failure! \(failure.localizedDescription)")
            }
        }
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

struct GridSectionPage: View {
    @StateObject private var viewModel = FeedGridSectionModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .trailing, pinnedViews: .sectionHeaders) {
                Section {
                    HStack {
                        Text("23:59까지 신청한 사진을 전부 보여줘요.")
                            .applyFont(font: .caption3)
                            .foregroundStyle(Color.grayB0B0B0)
                        Spacer()
                        Picker("주제 선택", selection: $viewModel.feedPicker) {
                            ForEach(FeedPicker.allCases, id: \.self) { picker in
                                Text(picker.rawValue)
                                    .tag(picker)
                            }
                        }.tint(Color.black)
                    }
                    
                    switch viewModel.feedType {
                    case .board_picture:
                        CardGridPage(viewModel: viewModel)
                    case .board:
                        FeedWritingPage(viewModel: viewModel)
                    }
                } header: {
                    DivideFeedPage(viewModel: viewModel)
                        .background(.white)
                }
            }
            .padding(.horizontal, 20)
            .navigationTitleWithRightButton(title: "오늘의 전체보기", text: "게시글 작성") {
                print("새글쓰기 tapped!")
            }
        }
    }
}

#Preview {
    NavigationStack {
        GridSectionPage()
    }
}

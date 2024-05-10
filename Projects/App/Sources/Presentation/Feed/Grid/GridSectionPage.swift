//
//  GridSectionPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class FeedGridSectionModel: ObservableObject {
    @Published var userChoiced: ContentSequence = .latest
    
    func tapSection(_ userChoice: ContentSequence) {
        self.userChoiced = userChoice
    }
}

struct GridSectionPage: View {
    @StateObject private var gridSectionModel = FeedGridSectionModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .trailing, pinnedViews: .sectionHeaders) {
                Section {
                    switch gridSectionModel.userChoiced {
                    case .latest:
                        LatestGridPage(girdPageModel: gridSectionModel)
                            .navigationTitleWithRightButton(title: "피드", text: "사진 신청") {
                                print("새글쓰기 tapped!")
                            }
                    case .popular:
                        PopularGridPage(gridSectionModel: gridSectionModel)
                            .navigationTitleWithRightButton(title: "피드", text: "새 글쓰기") {
                                print("새글쓰기 tapped!")
                            }
                    }
                } header: {
                    DivideFeedPage(gridPageModel: gridSectionModel)
                        .background(.white)
                }
            }
            .padding(.horizontal, 20)
        }
        
    }
}

#Preview {
    NavigationStack {
        GridSectionPage()
    }
}

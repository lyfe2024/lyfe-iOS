//
//  LatestGridPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/03.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine

class LatestGridViewModel: ObservableObject {
    let network = BoardNetwork()
    @Published var latestList: [BoardResponseDTO] = []
    
    private var cancellables = [AnyCancellable]()
    
    init() {
        $latestList
            .sink { [weak self] value in
                self?.getLatestBoard()
            }
            .store(in: &cancellables)
    }
    
    func getLatestBoard() {
        network.getLatestBoard("0", "BOARD", "2024-03-20") { result in
            switch result {
            case .success(let success):
                self.latestList = success.list
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct LatestGridPage: View {
    @ObservedObject var girdPageModel: FeedGridSectionModel
    @StateObject var viewModel = LatestGridViewModel()
    
    private let colums: [GridItem] = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, spacing: 12, content: {
                ForEach(viewModel.latestList, id: \.id) { index in
                    GirdCardPage(data: index)
                }
            })
        }
    }
}

#Preview {
    LatestGridPage(girdPageModel: FeedGridSectionModel())
}

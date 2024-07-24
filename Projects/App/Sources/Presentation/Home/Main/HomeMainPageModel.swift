//
//  HomeMainPageModel.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/16.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class TodayDate: ObservableObject {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd."
        return formatter
    }()
    
    static let date = dateFormatter.string(from: Date())
}

class HomeMainPageModel: ObservableObject {
    
    @Published var todayTopic: String = ""
    @Published var boardUser: BoardResponseDTO?
    @Published var latestData: [BoardResponseDTO] = []
    @Published var feedType: FeedType?
    @Published var feedData: [BoardResponseDTO] = []
    @Published var feedCardData: [BoardResponseDTO] = []
    @Published var totalData: [Any] = []
    @Published var tempData: [Any] = []
    @Published var width: CGFloat = 0
    
    private let color =  [Color.grayB0B0B0, Color.grayC6C6C6, Color.grayDDDDDD, Color.grayF9F9F9]
    private let topicService = TopicNetwork()
    private let boardService = BoardNetwork()
    
    func getTodayTopic() {
        topicService.getTodayTopic { result in
            switch result {
            case .success(let success):
                if let topic = success.content {
                    self.todayTopic = topic
                }
                
            case .failure(let failure):
                print("Topic fauilure! \(failure.localizedDescription)")
            }
        }
    }
    
    @MainActor
    func getLatestBoard(_ boardType: FeedType) {
        let todayDate = dateFormatter.string(from: Date())
        
        boardService.getLatestBoard("0", boardType.boardType, todayDate) { result in
            self.handleBoardResult(result, for: boardType)
        }
    }
    
    private func handleBoardResult(_ result: Result<BoardList, NetworkError>, for boardType: FeedType) {
        switch result {
        case .success(let success):
            self.updateData(success.list, for: boardType)
        case .failure(let failure):
            print("📕 SY) Data failure! \(failure.localizedDescription)")
        }
    }
    
    private func updateData(_ list: [BoardResponseDTO], for boardType: FeedType) {
        switch boardType {
        case .board_picture:
            self.feedCardData = list
            self.totalData = self.feedCardData + self.color
        case .board:
            self.feedData = list
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

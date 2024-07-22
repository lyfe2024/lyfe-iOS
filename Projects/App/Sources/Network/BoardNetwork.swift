//
//  BoardNetwork.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/09.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol BoardNetworkInterface {
    // 글 상세 조회
    func boards(_ type: FeedType, title: String, content: String, topicId: Int, completion: @escaping (Result<BoardPostResponseDTO, NetworkError>) -> Void)
    
    func boardDetail(_ value: String, completion: @escaping (Result<BoardResponseDTO, NetworkError>) -> Void)
    // 게시글 최신순 조회
    func getLatestBoard(_ cursorId: String, _ type: String, _ date: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void)
    // 게시글 인기순 조회
    func getPopularBoard(_ cursorId: String, _ type: String, _ popularType: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void)
    
    // 댓글 조회
    func getComments(_ cursorId: String, _ comment_board_id: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void)
}

final class BoardNetwork: NetworkService, BoardNetworkInterface {
    
    func boards(_ type: FeedType, title: String, content: String, topicId: Int, completion: @escaping (Result<BoardPostResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.boards()
        var parameters: [String: Any] = [:]
        parameters["title"] = title
        parameters["content"] = content
        parameters["boardType"] = type.rawValue
        parameters["topicId"] = topicId
        
        request(endpoint, method: .post, parameters: parameters, needToken: true) { (result: Result<BoardPostResponseDTO, NetworkError>) in
            completion(result)
        }
    }
    
    func boardDetail(_ value: String, completion: @escaping (Result<BoardResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.boardDetail(value)
        
        request(endpoint, method: .get) { (result: Result<BoardResponseDTO, NetworkError>) in
            completion(result)
        }
    }
    
    func getLatestBoard(_ cursorId: String, _ type: String, _ date: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.latestBoard()
        
        let parameters: [String: Any] = [
            "cursorId": cursorId,
            "type": type,
            "date" : date
        ]
        
        request(endpoint, method: .get, parameters: parameters) { (result: Result<BoardList, NetworkError>) in
            completion(result)
        }
    }
    
    func getPopularBoard(_ cursorId: String, _ type: String, _ popularType: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.popularBoard()
        
        let parameters: [String : Any] = [
            "type" : type,
            "cursorId" : cursorId,
            "popularType" : popularType
        ]
        
        request(endpoint, method: .get, parameters: parameters) { (result: Result<BoardList, NetworkError>) in
            completion(result)
        }
    }  

    func getComments(_ cursorId: String, _ comment_board_id: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.comments()
        
        let parametsr: [String : Any] = [
            "cursorId" : cursorId,
            "comment_board_id" : comment_board_id
        ]
        
        request(endpoint, method: .get, parameters: parametsr) { (result: Result<BoardList, NetworkError>) in
            completion(result)
        }
    }
}

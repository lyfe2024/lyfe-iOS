//
//  BoardNetwork.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/09.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol BoardNetworkInterface {
    func boards(_ type: BoardType, title: String, content: String, topicId: Int, completion: @escaping (Result<BoardPostResponseDTO, NetworkError>) -> Void)
    func boardDetail(_ value: String, completion: @escaping (Result<BoardResponseDTO, NetworkError>) -> Void)
}

final class BoardNetwork: NetworkService, BoardNetworkInterface {
    func boards(_ type: BoardType, title: String, content: String, topicId: Int, completion: @escaping (Result<BoardPostResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.boards()
        var parameters: [String: Any] = [:]
        parameters["title"] = title
        parameters["content"] = content
        parameters["boardType"] = type.rawValue
        parameters["topicId"] = topicId
        
        request(endpoint, method: .post, parameters: parameters) { (result: Result<BoardPostResponseDTO, NetworkError>) in
            completion(result)
        }
    }
    
    func boardDetail(_ value: String, completion: @escaping (Result<BoardResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.boardDetail(value)
        
        request(endpoint, method: .get) { (result: Result<BoardResponseDTO, NetworkError>) in
            completion(result)
        }
    }
}

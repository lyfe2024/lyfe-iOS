//
//  TopicNetwork.swift
//  Lyfe
//
//  Created by 박서연 on 2024/06/02.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol TopicNetworkInterface {
    func getTodayTopic(completion: @escaping (Result<TopicDTO, NetworkError>) -> Void)
}

final class TopicNetwork: NetworkService, TopicNetworkInterface {
    func getTodayTopic(completion: @escaping (Result<TopicDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.todayTopic()
        
        request(endpoint, method: .get) { (result: Result<TopicDTO, NetworkError>) in
            completion(result)
        }
    }
}

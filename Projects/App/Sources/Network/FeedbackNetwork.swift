//
//  FeedbackNetwork.swift
//  Lyfe
//
//  Created by 고세림 on 7/2/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol FeedbackNetworkInterface {
    func feedbacks(_ feedback: String, completion: @escaping (Result<FeedbackResponseDTO, NetworkError>) -> Void)
}

final class FeedbackNetwork: NetworkService, FeedbackNetworkInterface {
    func feedbacks(_ feedback: String, completion: @escaping (Result<FeedbackResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.feedbacks()
        var parameters: [String: Any] = [:]
        parameters["feedback"] = feedback
        
        request(endpoint, method: .post, parameters: parameters, needToken: true) { (result: Result<FeedbackResponseDTO, NetworkError>) in
            completion(result)
        }
    }
}

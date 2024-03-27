//
//  Network.swift
//  Lyfe
//
//  Created by 고세림 on 3/17/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case notConnected
    case response
    case decode
}

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

class NetworkService {
    func request<T: Decodable>(
        _ endpoint: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard NetworkReachabilityManager()?.isReachable == true else {
            completion(.failure(.notConnected))
            return
        }
        guard let url = URL(string: endpoint) else { return }
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: parameters == nil ? URLEncoding.default : JSONEncoding.default,
                   headers: ["Content-Type":"application/json"])
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let result = try JSONDecoder().decode(Response<T>.self, from: data)
                        guard let data = result.result else { return }
                        completion(.success(data))
                    } catch {
                        completion(.failure(.decode))
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    completion(.failure(.response))
                }
        }
    }
}

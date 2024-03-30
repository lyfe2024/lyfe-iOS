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
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard NetworkReachabilityManager()?.isReachable == true else {
            completion(.failure(.notConnected))
            return
        }
        guard let url = URL(string: endpoint) else { return }
        
        AF.request(url,
                   method: method,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
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
                    completion(.failure(.response)) // TODO : 에러 형식에 맞게 수정 필요
                }
        }
    }
}

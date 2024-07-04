//
//  NetworkIntercepter.swift
//  Lyfe
//
//  Created by 고세림 on 5/25/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkRequestInterceptor: RequestInterceptor {
    typealias AdapterResult = Swift.Result<URLRequest, Error>

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (AdapterResult) -> Void) {
        var urlRequest = urlRequest
        if let accessToken = AccountStorage.shared.accessToken {
            urlRequest.headers.add(.authorization(bearerToken: accessToken))
        }
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
                response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        reissue { success in
            if success {
                completion(.retry)
            } else {
                AccountStorage.shared.accessToken = nil
                AccountStorage.shared.refreshToken = nil
                
                completion(.doNotRetryWithError(error))
                
                Notification.needToLogIn.post()
            }
        }
    }
    
    private func reissue(completion: @escaping (Bool) -> Void) {
        let endpoint = APIEndpoint.reissue()
        var parameters: [String: Any] = [:]
        parameters["token"] = AccountStorage.shared.refreshToken
        
        guard let url = URL(string: endpoint) else { return }
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type":"application/json"])
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let result = try JSONDecoder().decode(Response<LoginResponseDTO>.self, from: data)
                        guard let data = result.result else { return }
                        
                        AccountStorage.shared.reset()
                        AccountStorage.shared.accessToken = data.accessToken
                        AccountStorage.shared.refreshToken = data.refreshToken
                        
                        completion(true)
                    } catch {
                        completion(false)
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    
                    completion(false)
                }
        }
    }
}

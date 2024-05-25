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
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = AccountStorage.shared.accessToken else {
            completion(.success(urlRequest))
            return
        }

        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
                response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        reissue {
            completion(.retry)
        }
    }
    
    private func reissue(completion: @escaping () -> Void) {
        let endpoint = APIEndpoint.reissue()
        var parameters: [String: Any] = [:]
        parameters["token"] = AccountStorage.shared.refreshToken
        
        guard let url = URL(string: endpoint) else { return }
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type":"application/json",
                             "Authorization": "Bearer \(String(describing: AccountStorage.shared.accessToken))"])
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let result = try JSONDecoder().decode(Response<LoginResponseDTO>.self, from: data)
                        guard let data = result.result else { return }
                        
                        AccountStorage.shared.accessToken = data.accessToken
                        AccountStorage.shared.refreshToken = data.refreshToken
                        
                        completion()
                    } catch {
                         // TODO: 로그아웃 후 재로그인 유도 ?
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    // TODO: 로그아웃 후 재로그인 유도 ?
                }
        }
    }
}

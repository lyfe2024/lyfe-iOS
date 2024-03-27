//
//  AuthNetwork.swift
//  Lyfe
//
//  Created by 고세림 on 3/23/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol AuthNetworkInterface {
    func kakaoLogin(_ token: String, completion: @escaping (Result<LoginResponseDTO, NetworkError>) -> Void)
    func checkNickname(_ value: String, completion: @escaping (Result<CheckNicknameResponseDTO, NetworkError>) -> Void)
}

final class AuthNetwork: NetworkService, AuthNetworkInterface {
    func kakaoLogin(_ token: String, completion: @escaping (Result<LoginResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.login()
        var parameters: [String: Any] = [:]
        parameters["socialType"] = "KAKAO"
        parameters["idToken"] = token
        parameters["authorizationCode"] = ""
        parameters["fcmToken"] = ""
        
        request(endpoint, method: .post, parameters: parameters) { (result: Result<LoginResponseDTO, NetworkError>) in
            completion(result)
       }
    }
    
    func checkNickname(_ value: String, completion: @escaping (Result<CheckNicknameResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.checkNickname(value)
        
        request(endpoint, method: .get) { (result: Result<CheckNicknameResponseDTO, NetworkError>) in
             completion(result)
        }
    }
}

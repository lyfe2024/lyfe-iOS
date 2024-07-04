//
//  UsersNetwork.swift
//  Lyfe
//
//  Created by 고세림 on 7/3/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol UsersNetworkInterface {
    func usersMe(completion: @escaping (Result<UsersMeResponseDTO, NetworkError>) -> Void)
}

final class UsersNetwork: NetworkService, UsersNetworkInterface {
    func usersMe(completion: @escaping (Result<UsersMeResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.usersMe()
        
        request(endpoint, method: .get, needToken: true) { (result: Result<UsersMeResponseDTO, NetworkError>) in
            completion(result)
        }
    }
}

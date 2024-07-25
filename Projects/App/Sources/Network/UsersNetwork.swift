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
    func userBoardList(_ cursorId: String, _ type: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void) // 자신이 작성한 글
}

final class UsersNetwork: NetworkService, UsersNetworkInterface {
    func usersMe(completion: @escaping (Result<UsersMeResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.usersMe()
        
        request(endpoint, method: .get, needToken: true) { (result: Result<UsersMeResponseDTO, NetworkError>) in
            completion(result)
        }
    }
    
    func userBoardList(_ cursorId: String, _ type: String, completion: @escaping (Result<BoardList, NetworkError>) -> Void) {
        // 자신이 작성한 글
        let endpoint = APIEndpoint.myboardList()
        
        let parameters: [String : Any] = [
            "cursorId" : cursorId,
            "type" : type
        ]
        
        request(endpoint, method: .get, parameters: parameters, needToken: true) { (result: Result<BoardList, NetworkError>) in
            completion(result)
        }
    }
}

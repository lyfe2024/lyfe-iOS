//
//  PolicyNetwork.swift
//  Lyfe
//
//  Created by 고세림 on 5/23/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol PolicyNetworkInterface {
    func term(completion: @escaping (Result<TermResponseDTO, NetworkError>) -> Void)
    func personalInfoAgreement(completion: @escaping (Result<TermResponseDTO, NetworkError>) -> Void)
}

final class PolicyNetwork: NetworkService, PolicyNetworkInterface {
    func term(completion: @escaping (Result<TermResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.term()
        
        request(endpoint, method: .get) { (result: Result<TermResponseDTO, NetworkError>) in
            completion(result)
        }
    }
    
    func personalInfoAgreement(completion: @escaping (Result<TermResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.personalInfoAgreement()
        
        request(endpoint, method: .get) { (result: Result<TermResponseDTO, NetworkError>) in
            completion(result)
        }
    }
}

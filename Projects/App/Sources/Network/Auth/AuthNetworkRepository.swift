//
//  AuthNetworkRepository.swift
//  Lyfe
//
//  Created by 박병준 on 2/18/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import Moya
import Combine
import CombineMoya

protocol AuthRepository {
    func reissue(token: String) -> AnyPublisher<Void, MoyaError>
    func login(reqModel: AuthApiLoginRequestModel) -> AnyPublisher<LoginResponseDTO, MoyaError>
    func join(reqModel: JoinApiRequestModel) -> AnyPublisher<Void, MoyaError>
}


final class AuthApiImpl: AuthRepository {
    
    private let provider = MoyaProvider<AuthApi>()
    
    func reissue(token: String) -> AnyPublisher<Void, Moya.MoyaError> {
        provider
            .requestPublisher(.reissueToken(requestModel: .init(token: token)))
            .map { _ -> Void in
                return ()
            }
            .eraseToAnyPublisher()
        
    }
    
    func login(reqModel: AuthApiLoginRequestModel) -> AnyPublisher<LoginResponseDTO, Moya.MoyaError> {
       
        provider
            .requestPublisher(.login(requetModel: reqModel))
            .compactMap{ innerResponse -> LoginResponseDTO? in
                
                let data = try? JSONDecoder().decode(LoginResponseDTO.self, from: innerResponse.data)
                return data
            }
            .eraseToAnyPublisher()
    }
    
    func join(reqModel: JoinApiRequestModel) -> AnyPublisher<Void, Moya.MoyaError> {
        provider
            .requestPublisher(.join(requetModel: reqModel))
            .map { _ -> Void in
                return ()
            }
            .eraseToAnyPublisher()
    }
    

    
}

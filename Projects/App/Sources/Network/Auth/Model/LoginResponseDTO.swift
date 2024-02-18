//
//  LoginResponseDTO.swift
//  Lyfe
//
//  Created by 박병준 on 2/18/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
struct LoginResponseDTO: Codable {
    var result: LoginResponseInnerDTO?
}

// MARK: - Result
struct LoginResponseInnerDTO: Codable {
    var accessToken, refreshToken: String?
}


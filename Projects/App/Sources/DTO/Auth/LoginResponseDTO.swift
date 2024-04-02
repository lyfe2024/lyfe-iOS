//
//  LoginResponseDTO.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct LoginResponseDTO: Decodable {
    var accessToken: String?
    var refreshToken: String?
}

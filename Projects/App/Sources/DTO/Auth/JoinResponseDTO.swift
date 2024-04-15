//
//  JoinResponseDTO.swift
//  Lyfe
//
//  Created by 고세림 on 4/16/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct JoinResponseDTO: Decodable {
    var accessToken: String?
    var refreshToken: String?
}

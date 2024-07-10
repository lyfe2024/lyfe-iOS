//
//  UsersMeResponseDTO.swift
//  Lyfe
//
//  Created by 고세림 on 7/3/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct UsersMeResponseDTO: Decodable {
    var id: Int?
    var username: String?
    var profile: String?
}

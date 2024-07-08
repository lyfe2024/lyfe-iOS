//
//  BoardResponseDTO.swift
//  Lyfe
//
//  Created by 박서연 on 2024/05/09.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct BoardList: Decodable {
    var list: [BoardResponseDTO]
}

struct BoardResponseDTO: Decodable, Identifiable {
    var id: Int?
    var user: User?
    var title: String?
    var content: String?
    var topic: String?
    var imageUrl: String?
    var boardType: String?
    var whiskyCount: Int?
    var commentCount: Int?
    var updateAt: String?
}

struct User: Decodable {
    var id: Int?
    var username: String?
    var profile: String?
}

struct BoardPostResponseDTO: Decodable {
    var id: Int?
}

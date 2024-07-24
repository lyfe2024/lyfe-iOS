//
//  CommentDTO.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/22.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct CommentList: Decodable {
    var list: [CommentDTO]
}

struct CommentDTO: Decodable {
    var id: Int?
    var content: String?
    var commentGroupId: Int?
    var user: User?
    let updateAt: String?
    let replies: [CommentGroupDTO]?
}

struct CommentGroupDTO: Decodable {
    var id: Int?
    var content: String?
    var commentGroupId: Int?
    var user: User?
    var updatedAt: String?
}

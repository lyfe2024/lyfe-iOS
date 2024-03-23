//
//  Response.swift
//  Lyfe
//
//  Created by 고세림 on 3/23/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let result: T?
}

//
//  APIError.swift
//  NetworkingInterface
//
//  Created by 송형욱 on 2023/09/21.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

public struct APIError: Error {

    var statusCode: Int!
    let errorCode: String
    var message: String

    init(statusCode: Int = 0, errorCode: String, message: String) {
        self.statusCode = statusCode
        self.errorCode = errorCode
        self.message = message
    }

    var errorCodeNumber: String {
        let numberString = errorCode.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return numberString
    }

    private enum CodingKeys: String, CodingKey {
        case errorCode
        case message
    }
}

extension APIError: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        errorCode = try container.decode(String.self, forKey: .errorCode)
        message = try container.decode(String.self, forKey: .message)
    }
}

//
//  Keychain.swift
//  Lyfe
//
//  Created by 고세림 on 4/16/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

final class Keychain {
    static func save(key: String, data: Data) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)
    }

    static func load(key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == noErr {
            return dataTypeRef as? Data
        } else {
            return nil
        }
    }

    static func delete(key: String) {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)
    }
}

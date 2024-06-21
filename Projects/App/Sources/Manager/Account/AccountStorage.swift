//
//  AccountStorage.swift
//  Lyfe
//
//  Created by 고세림 on 4/16/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

final class AccountStorage {
    static var shared = AccountStorage()
    
    var isGuest: Bool {
        return accessToken?.isEmpty ?? true
    }
    var accessToken: String? {
        get {
            guard let value = Keychain.load(key: "accessToken"),
                  !value.isEmpty,
                  let token = String(data: value, encoding: String.Encoding.utf8) else {
                return nil
            }
            debugPrint("🔮 get accessToken : \(token)")
            return token
        }
        set {
            if let value = newValue, let data = value.data(using: .utf8) {
                Keychain.save(key: "accessToken", data: data)
                debugPrint("🔮 save accessToken : \(value)")
            } else {
                Keychain.delete(key: "accessToken")
                debugPrint("🔮 delete accessToken")
            }
        }
    }
    var refreshToken: String? {
        get {
            guard let value = Keychain.load(key: "refreshToken"),
                  !value.isEmpty,
                  let token = String(data: value, encoding: String.Encoding.utf8) else {
                return nil
            }
            debugPrint("🔮 get refreshToken : \(token)")
            return token
        }
        set {
            if let value = newValue, let data = value.data(using: .utf8) {
                Keychain.save(key: "refreshToken", data: data)
                debugPrint("🔮 save refreshToken : \(value)")
            } else {
                Keychain.delete(key: "refreshToken")
                debugPrint("🔮 delete refreshToken")
            }
        }
    }
    
    func reset() {
        refreshToken = nil
        accessToken = nil
    }
}

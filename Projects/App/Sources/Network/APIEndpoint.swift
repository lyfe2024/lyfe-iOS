//
//  APIEndpoint.swift
//  Lyfe
//
//  Created by 고세림 on 3/17/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct APIEndpoint {
    private static let base = "http://52.79.169.145/v1"
    
    // 소셜로그인 접근
    static func login() -> String {
        let url = base + "/auth/login"
        return build(url: url)
    }
    
    // 닉네임 중복 체크
    static func checkNickname(_ value: String) -> String {
        let url = base + "/users/check-nickname/\(value)"
        return build(url: url)
    }
    
    private static func build(url: String, parameters: [String: Any] = [:]) -> String {
        var url = url
        for (index, parameter) in parameters.enumerated() {
            url.append(index == 0 ? "?" : "&")
            url.append(parameter.key)
            url.append("=\(parameter.value)")
        }
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? url
    }
}

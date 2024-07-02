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
    
    // 회원가입
    static func join() -> String {
        let url = base + "/auth/join"
        return build(url: url)
    }
    
    // 토큰 재발행
    static func reissue() -> String {
        let url = base + "/auth/reissue"
        return url
    }
    
    // 로그아웃
    static func revoke() -> String {
        let url = base + "/auth/revoke"
        return url
    }
    
    // 이용 약관 조회
    static func term() -> String {
        let url = base + "/policy/TERM"
        return url
    }
    
    // 개인 정보 수집 동의 조회
    static func personalInfoAgreement() -> String {
        let url = base + "/policy/PERSONAL_INFO_AGREEMENT"
        return url
    }
    
    static func boardDetail(_ boardID: String) -> String{
        let url = base + "/boards/detail/\(boardID)"
        return url
    }
    
    static func boards() -> String {
        let url = base + "/boards"
        return url
    }
    
    static func imageUploadUrl() -> String {
        let parameters = ["format": "jpg", "path": "topic_picture"]
        let url = base + "/images/get-upload-url"
        return build(url: url, parameters: parameters)
    }
    
    static func usersMe() -> String {
        let url = base + "/users/me"
        return url
    }
}

private extension APIEndpoint {
    static func build(url: String, parameters: [String: Any] = [:]) -> String {
        var url = url
        for (index, parameter) in parameters.enumerated() {
            url.append(index == 0 ? "?" : "&")
            url.append(parameter.key)
            url.append("=\(parameter.value)")
        }
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? url
    }
}

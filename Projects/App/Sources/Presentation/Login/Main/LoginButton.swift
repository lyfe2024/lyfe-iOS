//
//  LoginButton.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum Login: String, CaseIterable {
    case kakao
    case google
    case apple
    
    var image: Image {
        switch self {
        case .kakao:
            return Image("Kakao")
        case .google:
            return Image("Google")
        case .apple:
            return Image("Apple")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .kakao:
            return Color.kakaoBackground
        case .google:
            return Color.white
        case .apple:
            return Color.black
        }
    }
    
    var title: String {
        switch self {
        case .kakao:
            return "카카오로 3초만에 시작하기"
        case .google:
            return "Google로 계속하기"
        case .apple:
            return "Apple로 계속하기"
        }
    }
    
    var titleColor: Color {
        switch self {
        case .kakao:
            return Color.Gray363636
        case .google:
            return Color.Gray363636
        case .apple:
            return Color.white
        }
    }
}

struct LoginButton: View {
    let type: Login
    
    init(type: Login) {
        self.type = type
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: 18)
            
            type.image
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(type.title)
                .font(.bold(14))
                .frame(width: 220)
                .foregroundStyle(type.titleColor)
            
            Spacer()
                .frame(width: 18)
        }
        .frame(height: 48)
        .background(type.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

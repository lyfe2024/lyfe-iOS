//
//  Font.swift
//  Lyfe
//
//  Created by 박서연 on 2024/01/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct CustomFont {
    static let medium = "Pretendard-Medium"
    static let bold = "Pretendard-Bold"
    static let regular = "Pretendard-Regular.otf"
    static let semiBold = "Pretendard-SemiBold.otf"
    static let thinkRegular = "ThinkRegular"
}

extension Font {
    // Bold
    static let pretendardBold28: Font = .custom(CustomFont.bold, size: 28)
    static let pretendardBold20: Font = .custom(CustomFont.bold, size: 20)
    static let pretendardBold22: Font = .custom(CustomFont.bold, size: 22)
    static let pretendardBold18: Font = .custom(CustomFont.bold, size: 18)
    static let pretendardBold16: Font = .custom(CustomFont.bold, size: 16)
    static let pretendardBold14: Font = .custom(CustomFont.bold, size: 14)
    static let pretendardBold12: Font = .custom(CustomFont.bold, size: 12)
    
    // Regular
    static let thinkRegular80: Font = .custom(CustomFont.thinkRegular, size: 80)
    static let pretendardRegular18: Font = .custom(CustomFont.regular, size: 18)
    static let pretendardRegular16: Font = .custom(CustomFont.regular, size: 16)
    static let pretendardRegular14: Font = .custom(CustomFont.regular, size: 14)
    static let pretendardRegular12: Font = .custom(CustomFont.regular, size: 12)
    static let pretendardRegular10: Font = .custom(CustomFont.regular, size: 10)
    
    // SemiBold
    static let pretendardSemiBold14: Font = .custom(CustomFont.semiBold, size: 14)
    
    // Medium
}




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
    static let thinkRegular = "Think-Regular.otf"
}

extension Font {
    // Bold
    static let pretendardBold28: Font = .custom(CustomFont.bold, size: 28)
    static let pretendardBold20: Font = .custom(CustomFont.bold, size: 20)
    static let pretendardBold14: Font = .custom(CustomFont.bold, size: 14)
    
    // Regular
    static let pretendardRegular14: Font = .custom(CustomFont.regular, size: 14)
    static let pretendardRegular10: Font = .custom(CustomFont.regular, size: 10)
    static let thinkRegular80: Font = .custom(CustomFont.thinkRegular, size: 80)
    
    // SemiBold
    
    
    // Medium
}




//
//  Font.swift
//  Lyfe
//
//  Created by 박서연 on 2024/01/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

extension Font {
    
    /// 700
    static func bold(_ size: CGFloat) -> Font {
        return LyfeFontFamily.Pretendard.bold.swiftUIFont(size: size)
    }
    
    /// 500
    static func medium(_ size: CGFloat) -> Font {
        return LyfeFontFamily.Pretendard.medium.swiftUIFont(size: size)
    }
    
    /// 400
    static func regular(_ size: CGFloat) -> Font {
        return LyfeFontFamily.Pretendard.regular.swiftUIFont(size: size)
    }
    
    /// 600
    static func semiBold(_ size: CGFloat) -> Font {
        return LyfeFontFamily.Pretendard.semiBold.swiftUIFont(size: size)
    }
    
    static func thinkingRegular(_ size: CGFloat) -> Font {
        return LyfeFontFamily.Think.regular.swiftUIFont(size: size)
    }
}


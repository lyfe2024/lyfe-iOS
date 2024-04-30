//
//  Font.swift
//  DesignSystem
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import SwiftUI

extension Font {
    
    /// 700
    static func bold(_ size: CGFloat) -> Font {
        return DesignSystemFontFamily.Pretendard.bold.swiftUIFont(size: size)
    }
    
    /// 500
    static func medium(_ size: CGFloat) -> Font {
        return DesignSystemFontFamily.Pretendard.medium.swiftUIFont(size: size)
    }
    
    /// 400
    static func regular(_ size: CGFloat) -> Font {
        return DesignSystemFontFamily.Pretendard.regular.swiftUIFont(size: size)
    }
    
    /// 600
    static func semiBold(_ size: CGFloat) -> Font {
        return DesignSystemFontFamily.Pretendard.semiBold.swiftUIFont(size: size)
    }
    
    static func thinkingRegular(_ size: CGFloat) -> Font {
        return DesignSystemFontFamily.Think.regular.swiftUIFont(size: size)
    }
}


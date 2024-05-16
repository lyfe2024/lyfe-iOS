//
//  Font.swift
//  DesignSystem
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import SwiftUI

public enum LyfeFont {
    case heading1
    case heading2
    case heading3
    case heading4
    case heading5
    case title1
    case title2
    case title3
    case body1
    case body2
    case body3
    case button1
    case button2
    case button3
    case caption1
    case caption2
    case caption3
    case caption4
}

extension LyfeFont {
    public var nmae: String {
        switch self {
        case .heading1:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .heading2:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .heading3:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .heading4:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .heading5:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .title1:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .title2:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .title3:
            return DesignSystemFontFamily.Pretendard.bold.name
        case .body1:
            return DesignSystemFontFamily.Pretendard.medium.name
        case .body2:
            return DesignSystemFontFamily.Pretendard.medium.name
        case .body3:
            return DesignSystemFontFamily.Pretendard.medium.name
        case .button1:
            return DesignSystemFontFamily.Pretendard.semiBold.name
        case .button2:
            return DesignSystemFontFamily.Pretendard.semiBold.name
        case .button3:
            return DesignSystemFontFamily.Pretendard.semiBold.name
        case .caption1:
            return DesignSystemFontFamily.Pretendard.regular.name
        case .caption2:
            return DesignSystemFontFamily.Pretendard.regular.name
        case .caption3:
            return DesignSystemFontFamily.Pretendard.regular.name
        case .caption4:
            return DesignSystemFontFamily.Pretendard.regular.name
        }
    }
    
    public var size: CGFloat {
        switch self {
        case .heading1:
            return 32
        case .heading2:
            return 28
        case .heading3:
            return 24
        case .heading4:
            return 20
        case .heading5:
            return 18
        case .title1:
            return 18
        case .title2:
            return 16
        case .title3:
            return 14
        case .body1:
            return 18
        case .body2:
            return 16
        case .body3:
            return 14
        case .button1:
            return 16
        case .button2:
            return 14
        case .button3:
            return 12
        case .caption1:
            return 16
        case .caption2:
            return 14
        case .caption3:
            return 12
        case .caption4:
            return 10
        }
    }
    
    public var lineHeight: CGFloat {
        switch self {
        case .heading1:
            return 40
        case .heading2:
            return 38
        case .heading3:
            return 36
        case .heading4:
            return 32
        case .heading5:
            return 28
        case .title1:
            return 28
        case .title2:
            return 24
        case .title3:
            return 22
        case .body1:
            return 28
        case .body2:
            return 24
        case .body3:
            return 22
        case .button1:
            return 24
        case .button2:
            return 22
        case .button3:
            return 18
        case .caption1:
            return 24
        case .caption2:
            return 22
        case .caption3:
            return 18
        case .caption4:
            return 16
        }
    }
}


public struct FontModifier: ViewModifier {
    let font: LyfeFont
    
    init(font: LyfeFont) {
        self.font = font
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.custom(font.nmae, size: font.size))
            .padding(.vertical, (font.lineHeight - font.size) / 2)
    }
}

extension View {
    public func applyFont(font: LyfeFont) -> some View {
        modifier(FontModifier(font: font))
    }
}

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




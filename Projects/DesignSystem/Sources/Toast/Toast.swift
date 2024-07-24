//
//  Toast.swift
//  DesignSystem
//
//  Created by 고세림 on 5/22/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

public struct Toast: View {
    public enum Content {
        case success
        case warning
        
        var image: Image {
            switch self {
            case .success:
                DesignSystemAsset.icGreenCircleCheck.swiftUIImage
            case .warning:
                DesignSystemAsset.icMainErrorCircle.swiftUIImage
            }
        }
    }
    
    private(set) var type: Content
    private(set) var text: String
    private(set) var timeout: Int = 1
    
    init(type: Content, text: String) {
        self.type = type
        self.text = text
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
                .frame(width: 17)
            
            type.image
                .resizable()
                .frame(width: 18, height: 18)
            
            Spacer()
                .frame(width: 11)
            
            Text(text)
                .foregroundStyle(Color.white)
                .applyFont(font: .title3)
            
            Spacer()
                .frame(width: 16)
        }.background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.gray363636.opacity(0.8))
                .frame(height: 40)
        )
        .frame(height: 40)
    }
}

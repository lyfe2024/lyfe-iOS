//
//  CommonButton.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct CommonButton: View {
    private var title: String
    private var leadingImage: Image?
    private var isEnable: Bool = true
    private var height: CGFloat = 48
    private var action: (() -> Void)?
    
    init(title: String, leadingImage: Image? = nil) {
        self.title = title
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Spacer()
            
            leadingImage?
                .resizable()
                .frame(width: 20, height: 20)
            
            Text(title)
                .font(.bold(16))
                .foregroundStyle(isEnable ? Color.white : Color.Gray727272)
            
            Spacer()
        }
        .frame(height: height)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(isEnable ? Color.MainE86336 : Color.GrayF5F5F5)
        )
    }
}

extension CommonButton {
    func enable(_ isEnable: Bool) -> Self {
        var copy = self
        copy.isEnable = isEnable
        return copy
    }
    
    func height(_ height: CGFloat) -> Self {
        var copy = self
        copy.height = height
        return copy
    }
    
    func tap(action: @escaping (() -> Void)) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

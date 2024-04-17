//
//  ViewModifier.swift
//  DesignSystem
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier {
    let textColor: Color
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.bold(16))
            .padding(.vertical, 8)
            .foregroundColor(textColor)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

public extension Text {
    func setButtonModifier(textColor: Color, backgroundColor: Color) -> some View {
        self.modifier(ButtonModifier(textColor: textColor, backgroundColor: backgroundColor))
    }
}

public extension View {
    func customAlert(isShowing: Binding<Bool>,
                     type: CustomAlert,
                     title: String,
                     desc: String,
                     confirmButton: (() -> Void)? = nil,
                     cancelButton: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CustomAlertView(isShowing: isShowing,
                                      type: type,
                                      title: title,
                                      desc: desc,
                                      confirmButton: confirmButton,
                                      cancelButton: cancelButton))
    }
}

//
//  CustomAlert.swift
//  DesignSystem
//
//  Created by 박서연 on 2024/04/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import SwiftUI

public enum CustomAlert {
    case firstButton(title: String)
    case doubleButton(leftTitle: String, rightTitle: String)
}

public struct CustomAlertView: ViewModifier {
    @Binding var isShowing: Bool
    private let type: CustomAlert
    private let title: String
    private let desc: String
    private let confirmButton: (() -> Void)?
    private let cancelButton: (() -> Void)?
    
    init(isShowing: Binding<Bool>,
         type: CustomAlert,
         title: String,
         desc: String,
         confirmButton: (() -> Void)? = nil,
         cancelButton: (() -> Void)? = nil) {
        
        self._isShowing = isShowing
        self.type = type
        self.title = title
        self.desc = desc
        self.confirmButton = confirmButton
        self.cancelButton = cancelButton
    }
    
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                ZStack{
                    Color.black
                        .opacity(0.25)
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: desc.isEmpty ? 16 : 0) {
                        Text(title)
                            .font(.bold(18))
                            .padding(.vertical, 10)

                        if !desc.isEmpty {
                            Text(desc)
                                .font(.medium(16))
                                .padding(.vertical, 8)
                            
                            Spacer().frame(height: 16)
                        }
                        
                        switch type {
                        case .firstButton(let title):
                            Text(title)
                                .setButtonModifier(textColor: .white, backgroundColor: Color.MainE86336)
                                .onTapGesture {
                                    confirmButton?()
                                }
                            
                        case .doubleButton(let leftTitle, let rightTitle):
                            HStack(spacing: 16) {
                                Text(leftTitle)
                                    .setButtonModifier(textColor: Color.Gray5E5E5E, backgroundColor: Color.GrayF5F5F5)
                                    .onTapGesture {
                                        cancelButton?()
                                    }
                                Text(rightTitle)
                                    .setButtonModifier(textColor: .white, backgroundColor: Color.MainE86336)
                                    .onTapGesture {
                                        confirmButton?()
                                    }
                            }
                        }
                    }
                    .padding(16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 30)
                }
                .opacity(isShowing ? 1 : 0)
                .animation(.easeIn, value: isShowing)
            }
    }
}

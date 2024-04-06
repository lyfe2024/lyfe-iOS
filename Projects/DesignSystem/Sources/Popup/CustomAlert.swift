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
    private let leftButton: (() -> Void)?
    private let rightButton: (() -> Void)?
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                
            }
    }
}


/*
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
         .onTapGesture {
             action?()
         }
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

 */

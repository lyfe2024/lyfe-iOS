//
//  TextInput.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct TextInput: View {
    private var text: Binding<String>
    private var placeHolderText: String = ""
    private var trailingImage: Image = Image("CloseCircleFill")
    private var tapTrailingImage: (() -> Void)?
    private var maxCount: Int?
    private var isError: Bool = false

    init(text: Binding<String>) {
        self.text = text
    }
    
    var body: some View {
        HStack(spacing: 0) {
            TextField(
                "",
                text: text,
                prompt: Text(placeHolderText)
                    .foregroundColor(Color.GrayC6C6C6)
                    .font(.bold(16)),
                axis: .horizontal
            )
            .font(.bold(16))
            .foregroundStyle(getTextColor())
            .padding(.leading, 12)
            .padding(.top, 12)
            .padding(.bottom, 12)
            .disableAutocorrection(true)
            .onReceive(text.wrappedValue.publisher.collect()) {
                if let maxCount {
                    let s = String($0.prefix(maxCount))
                    if text.wrappedValue != s && (maxCount != 0) {
                        text.wrappedValue = s
                    }
                }
            }
            
            if text.wrappedValue.count > 0, tapTrailingImage != nil {
                trailingImage
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(14)
                    .onTapGesture {
                        tapTrailingImage?()
                    }
            }
        }.background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(getBorderColor(), lineWidth: 1)
        )
    }

    private func getTextColor() -> Color {
        return Color.Gray363636
    }
    
    private func getBorderColor() -> Color {
        if text.wrappedValue.isEmpty {
            return Color.GrayC6C6C6
        }
        if isError {
            return Color.redF95454
        }
        return Color.Gray363636
    }
}

extension TextInput {
    func maxCount(_ count: Int) -> Self {
        var copy = self
        copy.maxCount = count
        return copy
    }
    
    func setError(_ isError: Bool) -> Self {
        var copy = self
        copy.isError = isError
        return copy
    }
    
    func tapTrailingImage(action: @escaping (() -> Void)) -> Self {
        var copy = self
        copy.tapTrailingImage = action
        return copy
    }
}

//
//  ToastModifier.swift
//  DesignSystem
//
//  Created by 고세림 on 5/22/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    var toast: Toast
    @Binding var show: Bool
    
    @State private var timer: Timer?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                makeToast()
            )
    }
    
    @ViewBuilder
    private func makeToast() -> some View {
        if show {
            ZStack {
                VStack {
                    Spacer()
        
                    Toast(type: toast.type, text: toast.text)
        
                    Spacer()
                        .frame(height: 112)
                }
            }
            .onAppear {
                setup(timeout: toast.timeout)
            }
            .opacity(show ? 1.0 : 0.0)
        }
    }
    
    private func setup(timeout: Int) {
        guard show else { return }
        
        DispatchQueue.main.async { [self] in
            timer?.invalidate()
            timer = Timer.scheduledTimer(
                withTimeInterval: TimeInterval(timeout),
                repeats: false
            ) { _ in
                dismiss()
            }
        }
    }
    
    private func dismiss() {
        withAnimation(.easeInOut) {
            timer?.invalidate()
            timer = nil
            show = false
        }
    }
}

public extension View {
    func showToast(type: Toast.Content, text: String, show: Binding<Bool>) -> some View {
        self.modifier(
            ToastModifier(
                toast: Toast(type: type, text: text),
                show: show
            )
        )
    }
}

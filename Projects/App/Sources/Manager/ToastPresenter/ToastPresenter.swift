//
//  ToastPresenter.swift
//  Lyfe
//
//  Created by 고세림 on 7/5/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import DesignSystem

class ToastPresenter: ObservableObject {
    static let shared: ToastPresenter = ToastPresenter()

    @Published var isPresented: Bool = false
    private(set) var type: Toast.Content = .success
    private(set) var text: String = ""
    
    private init() {}
    
    func show(type: Toast.Content, text: String) {
        self.isPresented = true
        self.type = type
        self.text = text
    }
}

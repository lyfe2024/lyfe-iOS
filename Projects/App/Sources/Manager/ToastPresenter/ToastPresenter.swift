//
//  ToastPresenter.swift
//  Lyfe
//
//  Created by 고세림 on 7/5/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

class ToastPresenter: ObservableObject {
    static let shared: ToastPresenter = ToastPresenter()

    @Published var isPresented: Bool = false
    private(set) var text: String = ""
    
    private init() {}
    
    func show(text: String) {
        self.isPresented = true
        self.text = text
    }
}

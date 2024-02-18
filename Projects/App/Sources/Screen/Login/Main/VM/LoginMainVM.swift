//
//  LoginMainVM.swift
//  Lyfe
//
//  Created by 박병준 on 2/18/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



protocol LoginMainVMInput {
    func login(type: AuthApi.SocialType)
}
protocol LoginMainVMOutput {
    var error: PassthroughSubject<Error, Never> { get }
    
}
final class LoginMainVM: ObservableObject {

    enum Input {
        case login
        
        func action() {
            
        }
    }
    enum Output {
        
    }
    
    
    
    private let repo: AuthRepository
    
    init(repo: AuthRepository) {
        self.repo = repo
    }
    
    
}

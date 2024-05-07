//
//  AppleLoginManager.swift
//  Lyfe
//
//  Created by 고세림 on 5/1/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation
import AuthenticationServices

final class AppleLoginManager: NSObject {
    
    
    func login() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

extension AppleLoginManager: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("ASAuthorizationAppleIDCredential") // 여기로들어옴
            print(userIdentifier, fullName, email)
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
            print("ASPasswordCredential")
            print(username, password)
        default:
            break
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        debugPrint("Apple Login Error: \(error.localizedDescription)")
    }
}

extension AppleLoginManager: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let window = UIApplication.shared.windows.first else {
            fatalError()
        }
        return window
    }
}

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
    var completion: ((String, String) -> Void)?
    
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
        case let credential as ASAuthorizationAppleIDCredential:
            if let authorizationCode = credential.authorizationCode,
               let code = String(data: authorizationCode, encoding: .utf8),
               let token = credential.identityToken,
               let tokenString = String(data: token, encoding: .utf8) {
                completion?(tokenString, code)
            }
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

//
//  Notification.swift
//  Lyfe
//
//  Created by 고세림 on 7/5/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import UIKit

enum Notification {
    case needToLogIn
    
    var publisher: NotificationCenter.Publisher {
        switch self {
        case .needToLogIn:
            NotificationCenter.default.publisher(for: NSNotification.Name("NeedToLogIn"))
        }
    }
    
    func post(object: Any? = nil) {
        switch self {
        case .needToLogIn:
            DispatchQueue.main.async {
                NotificationCenter.default.post(
                    name: NSNotification.Name("NeedToLogIn"),
                    object: object
                )
            }
        }
    }
}

//
//  ModiDeletePopup.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum FeedPopup {
    case singleBtn
    case doubleBtn
}

struct PostPopup: View {
    let type: FeedPopup
    let removeAction: (() -> Void)?
    let updateAction: (() -> Void)?
    let reportAction: (() -> Void)?
    
    init(
        type: FeedPopup,
        removeAction: (() -> Void)? = nil,
        updateAction: (() -> Void)? = nil,
        reportAction: (() -> Void)? = nil
    ) {
        self.type = type
        self.removeAction = removeAction
        self.updateAction = updateAction
        self.reportAction = reportAction
    }
    
    var body: some View {
        VStack {
            switch type {
            case .singleBtn:
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 58, height: 36)
                    .overlay {
                        Text("신고")
                            .foregroundStyle(Color.gray600_5E5E5E)
                    }
                    .shadow(color: .black.opacity(0.1), radius: 10)

            case .doubleBtn:
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 58, height: 58)
                    .overlay {
                        VStack(spacing: 0) {
                            Text("삭제")
                                .padding(.vertical, 5)
                            RectangleComponent(color: Color.gray100_DDDDDD, height: 1)
                            Text("수정")
                                .padding(.vertical, 5)
                        }
                        .foregroundStyle(Color.gray600_5E5E5E)
                        .applyFont(font: .body3)
                    }
                    .shadow(color: .black.opacity(0.1), radius: 10)
            }
        }
    }
}

struct FeedPopupDemo: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            PostPopup(type: .doubleBtn)
        }
    }
}

#Preview {
    FeedPopupDemo()
}

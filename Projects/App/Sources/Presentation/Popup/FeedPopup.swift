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
    var removeAction: (() -> Void)?
    var updateAction: (() -> Void)?
    var reportAction: (() -> Void)?
    
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
                            .onTapGesture {
                                reportAction?()
                            }
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
                                .onTapGesture {
                                    removeAction?()
                                }
                            RectangleComponent(color: Color.gray100_DDDDDD, height: 1)
                            Text("수정")
                                .padding(.vertical, 5)
                                .onTapGesture {
                                    updateAction?()
                                }
                        }
                        .foregroundStyle(Color.gray600_5E5E5E)
                        .applyFont(font: .body3)
                    }
                    .shadow(color: .black.opacity(0.1), radius: 10)
            }
        }
    }
}

extension PostPopup {
    func tapUpdate(_ updateAction: @escaping (() -> Void)) -> Self {
        var copy = self
        copy.updateAction = updateAction
        return copy
    }
    
    func tapRemove(_ removeAction: @escaping (() -> Void)) -> Self {
        var copy = self
        copy.removeAction = removeAction
        return copy
    }
    
    func tapReport(_ reportAction: @escaping (() -> Void)) -> Self {
        var copy = self
        copy.reportAction = reportAction
        return copy
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

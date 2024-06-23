//
//  RectangleView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct RectangleComponent: View {
    let color: Color
    let height: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(maxWidth: .infinity)
            .frame(height: height)
    }
}

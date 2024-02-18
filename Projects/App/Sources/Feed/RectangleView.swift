//
//  RectangleView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        Rectangle()
            .fill(Color.GrayF9F9F9)
            .frame(maxWidth: .infinity)
            .frame(height: 8)
            .padding(.bottom, 8)
    }
}

#Preview {
    RectangleView()
}

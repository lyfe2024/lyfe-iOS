//
//  CommentGirdPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct CommentGirdPage: View {
    
    private let colums: [GridItem] = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: colums, spacing: 12, content: {
                ForEach(HomeSample.homeSample2, id: \.self) { index in
                    GirdCardPage(data: index)
                }
            })
        }
    }
}

#Preview {
    CommentGirdPage()
}


//
//  DivideFeedPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/08.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct DivideFeedPage: View {
    @ObservedObject var gridPageModel: FeedGridSectionModel
    
    var body: some View {
        HStack {
            ForEach(ContentSequence.allCases, id: \.self) { choiced in
                VStack(spacing: 0) {
                    Text("\(choiced.rawValue)")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(gridPageModel.userChoiced == choiced ? .MainE86336 : .GrayC6C6C6)
                        .font(gridPageModel.userChoiced == choiced ? .bold(18) : .medium(18))
                        .padding(.vertical, 10) // lineHeight(28 맞춤용)
                        
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(gridPageModel.userChoiced == choiced ? .MainE86336 : .clear)
                }
                .onTapGesture {
                    gridPageModel.tapSection(choiced)
                    print(choiced.rawValue)
                }
                .animation(.easeOut, value: gridPageModel.userChoiced)
            }
        }
    }
}

#Preview {
    DivideFeedPage(gridPageModel: FeedGridSectionModel())
}

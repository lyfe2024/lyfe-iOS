//
//  ChosePostPhotoView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct ChosePostPhotoPage: View {
    
    @State private var chosenPost: [Int] = [0, 1, 2]
    @State private var startChosenNumber = 0
    
    private let chosenEdge = EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
    private let noneEdge = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(chosenPost, id: \.self) { chosen in
                    Rectangle()
                        .fill(chosen == startChosenNumber ? Color.MainE86336 : Color.GrayDDDDDD)
                        .frame(height: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .padding(chosen == startChosenNumber ? chosenEdge : noneEdge)
                }
            }
            CardView(data: HomeSample.homeSample[startChosenNumber], cardValue: .past)
                .frame(maxWidth: .infinity)
        }
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if value.translation.width > 100 {
                        startChosenNumber == 0 ? (startChosenNumber += 0 ) : (startChosenNumber -= 1)
                    } else if value.translation.width < -100 {
                        startChosenNumber == 2 ? (startChosenNumber += 0) : (startChosenNumber += 1)
                    }
                })
        )
        .animation(.easeOut, value: startChosenNumber)
    }
}

#Preview {
    ChosePostPhotoPage()
}

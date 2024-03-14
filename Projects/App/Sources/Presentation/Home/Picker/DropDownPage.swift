//
//  DropDownView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct DropDownPage: View {
    @State private var selected: HomePicker = .today
    @State var showOptions = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    Image(systemName: "chevron.down")
                        .font(.bold(14))
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: showOptions ? -180 : 0))
                    Text(selected.rawValue)
                        .lineLimit(1)
                }
                .frame(width: .infinity, height: 40)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
                
                if showOptions {
                    OptionView()
                        .zIndex(2)
                }
            }
        }
    }
    
    @ViewBuilder
    func OptionView() -> some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(HomePicker.allCases, id: \.self) { option in
                    Text(option.rawValue)
                        .foregroundStyle(selected.rawValue == option.rawValue ? Color.primary : Color.gray)
                        .padding(.vertical, 5)
                        .animation(.none, value: selected)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selected = option
                                showOptions = false
                            }
                        }
                        .transition(.move(edge: .top))
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 40)
            .background(Color.GrayF5F5F5)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    DropDownPage()
}

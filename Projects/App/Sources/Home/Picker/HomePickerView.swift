//
//  HomePickerView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum HomePicker: String, CaseIterable {
    case today = "오늘의 주제"
    case past = "과거 베스트"
}

struct HomePickerView: View {
    @State var selected: HomePicker = .today
    
    var body: some View {
        VStack {
            Picker("Choose a color", selection: $selected) {
                ForEach(HomePicker.allCases, id: \.self) { selected in
                    Text(selected.rawValue)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .tint(Color.black)
        }
    }
}

#Preview {
    HomePickerView()
}

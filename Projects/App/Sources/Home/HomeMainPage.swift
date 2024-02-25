//
//  HomeMainView.swift
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

class HomeMainPageModel: ObservableObject {
    // 오늘 날짜..?
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd."
        return formatter
    }()
    
    let date = dateFormatter.string(from: Date())
}

struct HomeMainPage: View {
    @StateObject var homePickerPageModel = HomeMainPageModel()
    @State private var selected: HomePicker = .today
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topTrailing) {
                Spacer().frame(height: 16)
                Text("\(homePickerPageModel.date)")
                    .foregroundColor(.black)
                    .opacity(0.1)
                    .font(.thinkRegular80)
                VStack(alignment: .leading) {
                    Image("Logo")
                    Spacer().frame(height: 21)
                    
                    Picker("주제 선택", selection: $selected) {
                        ForEach(HomePicker.allCases, id: \.self) { selected in
                            Text(selected.rawValue)
                                .tag(selected.rawValue)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .tint(Color.black)
                    Spacer().frame(height: 9)
                    
                    switch selected {
                    case .today:
                        TodayHomePage()
                    case .past:
                        PastPostPage()
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .background(Color.backgroundFf5f5f5)
        .animation(.spring(), value: selected)
    }
}

#Preview {
    HomeMainPage()
}

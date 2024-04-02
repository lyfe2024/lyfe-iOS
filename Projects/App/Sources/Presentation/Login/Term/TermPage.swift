//
//  TermPage.swift
//  Lyfe
//
//  Created by 고세림 on 4/2/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

final class TermPageModel: ObservableObject {
    private let networkService = AuthNetwork()
    var token: String
    var nickname: String
    
    @Published var isTermChecked: Bool = false
    @Published var isPersonalInfoChecked: Bool = true
    
    init(token: String, nickname: String) {
        self.token = token
        self.nickname = nickname
    }
}


struct TermPage: View {
    @ObservedObject var viewModel: TermPageModel
    @EnvironmentObject var router: Router
    
    init(viewModel: TermPageModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("회원가입 약관 동의")
                .font(.bold(24))
            
            Spacer()
                .frame(height: 8)
            
            Text("마지막 단계에요!")
                .font(.regular(14))
            
            Spacer()
                .frame(height: 56)
            
            Spacer()
            
            CommonButton(title: "완료")
                .enable(
                    viewModel.isTermChecked
                    && viewModel.isPersonalInfoChecked
                )
                .height(48)
                .tap {
                    // move to next page
                }
            
            Spacer()
                .frame(height: 24)
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
    

}

#Preview {
    TermPage(viewModel: .init(token: "", nickname: ""))
}

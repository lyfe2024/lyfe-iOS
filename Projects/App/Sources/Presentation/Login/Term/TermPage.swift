//
//  TermPage.swift
//  Lyfe
//
//  Created by 고세림 on 4/2/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine

enum Term {
    case term
    case personalInfo
    
    var title: String {
        switch self {
        case .term:
            return "서비스 이용 약관 (필수)"
        case .personalInfo:
            return "개인정보 수집 및 이용 (필수)"
        }
    }
    
    var icon: String {
        switch self {
        case .term:
            return "💾"
        case .personalInfo:
            return "🔫"
        }
    }
}

final class TermPageModel: ObservableObject {
    private let authNetworkService = AuthNetwork()
    private let policyNetworkService = PolicyNetwork()
    
    private var token: String
    private var nickname: String
    private(set) var termTitle: String = ""
    private(set) var termContent: String = ""
    
    @Published var isAllChecked: Bool = false
    @Published var isTermChecked: Bool = false
    @Published var isPersonalInfoChecked: Bool = false
    
    private var cancellables = [AnyCancellable]()

    init(token: String, nickname: String) {
        self.token = token
        self.nickname = nickname
        
        $isTermChecked
            .combineLatest($isPersonalInfoChecked)
            .sink { [weak self] term, personalInfo in
                self?.isAllChecked = term && personalInfo
            }
            .store(in: &cancellables)
    }
    
    func toggleAll() {
        if isTermChecked && isPersonalInfoChecked {
            isTermChecked = false
            isPersonalInfoChecked = false
        } else {
            isTermChecked = true
            isPersonalInfoChecked = true
        }
    }
    
    func join(completion: @escaping () -> Void) {
        authNetworkService
            .join(token, nickname: nickname) { result in
                switch result {
                case .success(let data):
                    AccountStorage.shared.accessToken = data.accessToken
                    AccountStorage.shared.refreshToken = data.refreshToken
                    completion()
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    return
                }
            }
    }
    
    func loadTerm(completion: @escaping () -> Void) {
        policyNetworkService
            .term { [weak self] result in
                switch result {
                case .success(let data):
                    self?.termTitle = data.title ?? ""
                    self?.termContent = data.content ?? ""
                    completion()
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
    }
    
    func loadPersonalInfoAgreement(completion: @escaping () -> Void) {
        policyNetworkService
            .personalInfoAgreement { [weak self] result in
                switch result {
                case .success(let data):
                    self?.termTitle = data.title ?? ""
                    self?.termContent = data.content ?? ""
                    completion()
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
    }
}

struct TermPage: View {
    @ObservedObject var viewModel: TermPageModel
    @EnvironmentObject var router: Router
    
    @State var isTermChecked: Bool = false

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
            
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 10)
                
                ZStack {
                    Image(
                        viewModel.isAllChecked
                          ? "CheckBoxSelected"
                          : "CheckBoxDefault"
                    )
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .frame(width: 32, height: 32)
                
                Spacer()
                    .frame(width: 8)
                
                Text("아래의 약관에 모두 동의합니다.")
                    .font(.bold(16))
                    .foregroundStyle(.black)
                
                Spacer()
            }.background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.GrayC6C6C6, lineWidth: 1)
                    .frame(height: 46)
            )
            .onTapGesture {
                viewModel.toggleAll()
            }

            Spacer()
                .frame(height: 18)
                .foregroundStyle(.red)
            
            SingleTermView(
                isChecked: $viewModel.isTermChecked,
                term: .term
            ) { term in
                viewModel.loadTerm {
                    moveToTermDetail(term)
                }
            }
            
            SingleTermView(
                isChecked: $viewModel.isPersonalInfoChecked,
                term: .personalInfo
            ) { term in
                viewModel.loadPersonalInfoAgreement {
                    moveToTermDetail(term)
                }
            }
            
            Spacer()
            
            CommonButton(title: "완료")
                .enable(
                    viewModel.isAllChecked
                )
                .height(48)
                .tap {
                    viewModel.join() {
                        router.replaceNavigationStack(.tabView)
                    }
                }
            
            Spacer()
                .frame(height: 24)
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
    
    func moveToTermDetail(_ term: Term) {
        router.navigateTo(
            .termDetail(
                term.icon,
                viewModel.termTitle,
                viewModel.termContent
            )
        )
    }
}

#Preview {
    TermPage(viewModel: .init(token: "", nickname: ""))
}

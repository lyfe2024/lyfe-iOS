//
//  NicknamePage.swift
//  Lyfe
//
//  Created by 고세림 on 3/24/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Combine

final class NicknamePageModel: ObservableObject {
    private let networkService = AuthNetwork()

    @Published var text: String = ""
    @Published var isCharacterAvailable: Bool = false
    @Published var isSymbolAvailable: Bool = true
    
    private var cancellables = [AnyCancellable]()
    
    init() {
        $text
            .sink { [weak self] value in
                self?.validateText(value)
            }
            .store(in: &cancellables)
    }
    
    func checkNickname(completion: @escaping () -> Void) {
        networkService
            .checkNickname(text) { result in
                switch result {
                case .success(let data):
                    completion()
                case .failure(let error):
                    // TODO: - Error 인 경우 토스트 노출
                    debugPrint(error.localizedDescription)
                }
            }
    }
    
    private func validateText(_ value: String) {
        let pattern = "^(?=.*[0-9])(?=.*[ㄱ-힣a-zA-Z])[ㄱ-힣a-zA-Z0-9]+$"
        if let _ = value.range(of: pattern, options: .regularExpression) {
            isCharacterAvailable = true
            isSymbolAvailable = true
        } else {
            isCharacterAvailable = false
            isSymbolAvailable = false
        }
    }
}

struct NicknamePage: View {
    @StateObject var viewModel = NicknamePageModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("닉네임 설정")
                .font(.bold(24))
            
            Spacer()
                .frame(height: 8)
            
            Text("원하는 닉네임을 설정해주세요.")
                .font(.regular(14))
            
            Spacer()
                .frame(height: 56)
            
            TextInput(text: $viewModel.text)
                .setError(
                    !viewModel.isCharacterAvailable
                    || !viewModel.isSymbolAvailable
                )
                .maxCount(10)
                .tapTrailingImage {
                    viewModel.text = ""
                }
                .frame(height: 48)
            
            Spacer()
                .frame(height: 8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    getImage()
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor())
                    
                    Text("한글/영문+숫자 조합으로 설정해주세요")
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor())
                }
                
                HStack(spacing: 6) {
                    getImage()
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor())

                    Text("특수문자는 사용할 수 없어요")
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor())
                }
                
                HStack(spacing: 6) {
                    getImage()
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor())

                    Text("최대 10글자로 설정해주세요")
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor())
                }
            }
            
            Spacer()
            
            CommonButton(title: "다음")
                .enable(
                    viewModel.isCharacterAvailable
                    && viewModel.isSymbolAvailable
                )
                .height(48)
                .tap {
                    viewModel.checkNickname() {
                        // move to next page 
                    }
                }
            
            Spacer()
                .frame(height: 24)
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
    }
    
    private func getValidationColor() -> Color {
        if viewModel.text.isEmpty {
            return Color.GrayC6C6C6
        }
        if viewModel.isCharacterAvailable && viewModel.isSymbolAvailable {
            return Color.hreen199F3E
        }
        return Color.redF95454
    }
    
    private func getImage() -> Image {
        if viewModel.text.isEmpty {
            return Image("Check")
        }
        if viewModel.isCharacterAvailable && viewModel.isSymbolAvailable {
            return Image("Check")
        }
        return Image("Unavailable")
    }
}

#Preview {
    NicknamePage()
}

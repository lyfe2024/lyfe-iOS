//
//  UserProfileSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher
import Combine

final class UserProfileSettingPageModel: ObservableObject {
    private let usersNetworkService = UsersNetwork()
    private let authNetworkService = AuthNetwork()
    
    @Published var nickname: String = ""
    @Published var profileImageUrl: String = ""
    @Published var isCharacterAvailable: Bool = false
    @Published var isSymbolAvailable: Bool = false
    
    private var cancellables = [AnyCancellable]()

    init() {
        $nickname
            .sink { [weak self] value in
                self?.validateText(value)
            }
            .store(in: &cancellables)
    }
    
    func getProfile() {
        usersNetworkService
            .usersMe { [weak self] result in
                switch result {
                case .success(let data):
                    self?.nickname = data.username ?? ""
                    self?.profileImageUrl = data.profile ?? ""
                case .failure:
                    return
                }
            }
    }
    
    func checkNickname(completion: @escaping (Bool) -> Void) {
        authNetworkService
            .checkNickname(nickname) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure(let error):
                    completion(false)
                    debugPrint(error.localizedDescription)
                }
            }
    }
    
    private func validateText(_ value: String) {
        let pattern = "^(?=.*[0-9])(?=.*[ㄱ-힣a-zA-Z])[ㄱ-힣a-zA-Z0-9]+$"
        if let _ = value.range(of: pattern, options: .regularExpression) {
            isCharacterAvailable = true
        } else {
            isCharacterAvailable = false
        }
        
        let symbolPattern = "^[ㄱ-힣A-Za-z0-9]*$"
        if let _ = value.range(of: symbolPattern, options: .regularExpression) {
            isSymbolAvailable = true
        } else {
            isSymbolAvailable = false
        }
    }
}

struct UserProfileSettingPage: View {
    @EnvironmentObject var router: Router
    @StateObject var userProfileSettingPageModel = UserProfileSettingPageModel()
    
    var body: some View {
        VStack {
            Text("프로필 수정")
                .font(.bold(24))
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 24)
            
            ZStack(alignment: .bottomTrailing) {
                if let url = URL(string: userProfileSettingPageModel.profileImageUrl) {
                    KFImage(url)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    DesignSystemAsset.icGrayNoneUser.swiftUIImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
                
                Button {
                    print("프로필 수정 버튼 tapped")
                } label: {
                    DesignSystemAsset.icMainPlus.swiftUIImage
                        .alignmentGuide(.bottom, computeValue: { dimension in
                            dimension[.bottom] * 0.8
                        })
                        .alignmentGuide(.trailing, computeValue: { dimension in
                            dimension[.bottom] * 0.7
                        })
                }
            }
            
            Spacer()
                .frame(height: 32)
            
            VStack(alignment: .leading) {
                TextInput(text: $userProfileSettingPageModel.nickname)
                    .setError(
                        !userProfileSettingPageModel.isCharacterAvailable
                    )
                    .maxCount(10)
                    .tapTrailingImage {
                        userProfileSettingPageModel.nickname = ""
                    }
                    .frame(height: 48)
                
                Spacer()
                    .frame(height: 8)
                
                HStack(spacing: 6) {
                    getValidationImage(userProfileSettingPageModel.isCharacterAvailable)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor(userProfileSettingPageModel.isCharacterAvailable))
                    
                    Text(characterValidationText)
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor(userProfileSettingPageModel.isCharacterAvailable))
                }
                
                Spacer()
                    .frame(height: 4)
                
                HStack(spacing: 6) {
                    getValidationImage(userProfileSettingPageModel.isSymbolAvailable)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor(userProfileSettingPageModel.isSymbolAvailable))

                    Text(symbolValidationText)
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor(userProfileSettingPageModel.isSymbolAvailable))
                }
            }
            
            Spacer()
            
            CommonButton(title: "완료")
                .enable(
                    userProfileSettingPageModel.isCharacterAvailable
                    && userProfileSettingPageModel.isSymbolAvailable
                )
                .height(48)
                .tap {
                    userProfileSettingPageModel.checkNickname() { success in
                        if success {
                            print("successed")
                        } else {
                            print("failure")
                        }
                    }
                }
            
            Spacer()
                .frame(height: 24)
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
        .onAppear {
            userProfileSettingPageModel.getProfile()
        }
    }
    
    private var characterValidationText: String {
        if userProfileSettingPageModel.nickname.isEmpty {
            return "한글/영문+숫자 조합으로 설정해주세요"
        }
        if userProfileSettingPageModel.isCharacterAvailable {
            return "한글/영문+숫자 조합으로 설정되었어요"
        }
        return "한글/영문+숫자 조합으로 설정해주세요"
    }
    
    private var symbolValidationText: String {
        if userProfileSettingPageModel.nickname.isEmpty {
            return "특수문자는 사용할 수 없어요"
        }
        if userProfileSettingPageModel.isSymbolAvailable {
            return "사용된 특수문자가 없어요"
        }
        return "특수문자는 사용할 수 없어요"
    }
    
    private func getValidationColor(_ isAvailable: Bool) -> Color {
        if userProfileSettingPageModel.nickname.isEmpty {
            return .GrayC6C6C6
        }
        if isAvailable {
            return .hreen199F3E
        }
        return .redF95454
    }

    private func getValidationImage(_ isAvailable: Bool) -> Image {
        if userProfileSettingPageModel.nickname.isEmpty {
            return DesignSystemAsset.icGrayCheck.swiftUIImage
        }
        if isAvailable {
            return DesignSystemAsset.icGrayCheck.swiftUIImage
        }
        return DesignSystemAsset.icRedDisable.swiftUIImage
    }
}

#Preview {
    NavigationStack {
        UserProfileSettingPage()
    }
}

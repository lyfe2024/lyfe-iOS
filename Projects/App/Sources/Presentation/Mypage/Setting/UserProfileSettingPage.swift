//
//  UserProfileSettingPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import PhotosUI
import DesignSystem
import Kingfisher
import Combine

final class UserProfileSettingPageModel: ObservableObject {
    private let usersNetworkService = UsersNetwork()
    private let authNetworkService = AuthNetwork()
    private let imageNetworkService = ImageNetwork()
    private let baseImageUrl = "https://lyfe-s3.s3.ap-northeast-2.amazonaws.com/"
    
    @Published var nickname: String = ""
    @Published var profileImageUrl: String = ""
    @Published var isCharacterAvailable: Bool = false
    @Published var isSymbolAvailable: Bool = false
    @Published var selectedImage: PhotosPickerItem? = nil
    @Published var selectedPhotoData: Data?
    
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
    
    func save(completion: @escaping (Bool) -> Void) {
        getUploadUrl { [weak self] url, key in
            guard let data = self?.selectedPhotoData else { return }
            self?.imageNetworkService.uploadImage(url, data: data, completion: { [weak self] successed in
                if successed {
                    self?.saveContent(key: key) { result in
                        completion(result)
                    }
                } else {
                    completion(false)
                }
            })
        }
    }
    
    private func getUploadUrl(completion: @escaping (String, String) -> Void) {
        imageNetworkService
            .uploadUrl { result in
                switch result {
                case .success(let data):
                    if let url = data.url, let key = data.key {
                        completion(url, key)
                    }
                case .failure(_):
                    return
                }
            }
    }
    
    private func saveContent(key: String, completion: @escaping (Bool) -> Void) {
        let url = baseImageUrl + key
        usersNetworkService
            .usersMePut(nickname: nickname, profileUrl: url) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure(_):
                    completion(false)
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
    @StateObject var viewModel = UserProfileSettingPageModel()
    @State private var showToast: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("프로필 수정")
                .applyFont(font: .heading3)
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity, alignment: .leading)

            PhotosPicker(selection: $viewModel.selectedImage) {
                ZStack(alignment: .bottomTrailing) {
                    if let selectedPhoto = viewModel.selectedPhotoData,
                       let image = UIImage(data: selectedPhoto) {
                        GeometryReader { geometry in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .compositingGroup()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .mask {
                                    Circle()
                                }
                        }
                    } else if let url = URL(string: viewModel.profileImageUrl) {
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
                    
                    DesignSystemAsset.icMainPlus.swiftUIImage
                        .alignmentGuide(.bottom, computeValue: { dimension in
                            dimension[.bottom] * 0.8
                        })
                        .alignmentGuide(.trailing, computeValue: { dimension in
                            dimension[.bottom] * 0.7
                        })
                }
            }
            .frame(width: 74, height: 74)
            .onChange(of: viewModel.selectedImage) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        viewModel.selectedPhotoData = data
                    }
                }
            }
            
            Spacer()
                .frame(height: 32)
            
            VStack(alignment: .leading) {
                TextInput(text: $viewModel.nickname)
                    .setError(
                        !viewModel.isCharacterAvailable
                    )
                    .maxCount(10)
                    .tapTrailingImage {
                        viewModel.nickname = ""
                    }
                    .frame(height: 48)
                
                Spacer()
                    .frame(height: 8)
                
                HStack(spacing: 6) {
                    getValidationImage(viewModel.isCharacterAvailable)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor(viewModel.isCharacterAvailable))
                    
                    Text(characterValidationText)
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor(viewModel.isCharacterAvailable))
                }
                
                Spacer()
                    .frame(height: 4)
                
                HStack(spacing: 6) {
                    getValidationImage(viewModel.isSymbolAvailable)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(getValidationColor(viewModel.isSymbolAvailable))

                    Text(symbolValidationText)
                        .font(.regular(14))
                        .foregroundStyle(getValidationColor(viewModel.isSymbolAvailable))
                }
            }
            
            Spacer()
            
            CommonButton(title: "완료")
                .enable(
                    viewModel.isCharacterAvailable
                    && viewModel.isSymbolAvailable
                )
                .height(48)
                .tap {
                    viewModel.checkNickname() { success in
                        if success {
                            viewModel.save { successed in
                                if successed {
                                    router.navigateBack()
                                }
                            }
                        } else {
                            showToast = true
                        }
                    }
                }
            
            Spacer()
                .frame(height: 24)
        }
        .padding(.horizontal, 20)
        .LyfeNaivigationLButton(LyfeCommon.ic_black_arrow_back) {
            router.navigateBack()
        }
        .onAppear {
            viewModel.getProfile()
        }
        .showToast(type: .warning, text: "사용중인 닉네임입니다.", show: $showToast)
    }
    
    private var characterValidationText: String {
        if viewModel.nickname.isEmpty {
            return "한글/영문+숫자 조합으로 설정해주세요"
        }
        if viewModel.isCharacterAvailable {
            return "한글/영문+숫자 조합으로 설정되었어요"
        }
        return "한글/영문+숫자 조합으로 설정해주세요"
    }
    
    private var symbolValidationText: String {
        if viewModel.nickname.isEmpty {
            return "특수문자는 사용할 수 없어요"
        }
        if viewModel.isSymbolAvailable {
            return "사용된 특수문자가 없어요"
        }
        return "특수문자는 사용할 수 없어요"
    }
    
    private func getValidationColor(_ isAvailable: Bool) -> Color {
        if viewModel.nickname.isEmpty {
            return .GrayC6C6C6
        }
        if isAvailable {
            return .hreen199F3E
        }
        return .redF95454
    }

    private func getValidationImage(_ isAvailable: Bool) -> Image {
        if viewModel.nickname.isEmpty {
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

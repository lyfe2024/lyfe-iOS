//
//  UserExperiencePage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

final class UserExperiencePageModel: ObservableObject {
    private let feedbackNetworkService = FeedbackNetwork()
    
    @Published var content: String = ""
    @Published var peedBackButton: Bool = false
    
    func save(completion: @escaping () -> Void) {
        feedbackNetworkService.feedbacks(content) { result in
            switch result {
            case .success:
                completion()
            case .failure:
                return
            }
        }
    }
    
    fileprivate func checkingContent() -> Bool {
        return content.isEmpty ? false : true
    }
}

struct UserExperiencePage: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var toastPresenter: ToastPresenter
    @StateObject var userExperiencePageModel = UserExperiencePageModel()
    @FocusState private var focusField: FocusField?
    private var placeholder = "내용을 입력해주세요"
    
    private enum FocusField {
        case feedback
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("사용경험")
                    .font(.bold(24))
                    .padding(.vertical, 6)
                
                Text("Lyfe에서의 경험을 편하게 말씀해주세요.\n긍정/부정적인 피드백 무엇이든 괜찮아요.")
                    .font(.medium(14))
                    .padding(.vertical, 4)
            }
            
            Spacer().frame(height: 16)
            
            TextEditor(text: $userExperiencePageModel.content)
                .font(.medium(16))
                .foregroundColor(.black)
                .padding(.init(top: 7, leading: 12, bottom: 7, trailing: 12))
                .frame(maxWidth: .infinity, maxHeight: 176)
                .scrollContentBackground(.hidden)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(userExperiencePageModel.content.isEmpty ? Color.GrayC6C6C6 : Color.black, lineWidth: 1)
                        .frame(maxWidth: .infinity, maxHeight: 176)
                )
                .overlay(alignment: .topLeading) {
                    if userExperiencePageModel.content.isEmpty {
                        Text(placeholder)
                            .font(.medium(16))
                            .padding(.init(top: 15, leading: 16, bottom: 15, trailing: 16))
                            .foregroundColor(userExperiencePageModel.content.isEmpty ? Color.GrayC6C6C6 : Color.black)
                    }
                        
                }
                .onChange(of: userExperiencePageModel.content) { newValue in
                    if newValue.count > 500 {
                        userExperiencePageModel.content = String(newValue.prefix(500))
                    }
                }
                .focused($focusField, equals: .feedback)
            
            HStack(spacing: 0) {
                Spacer()
                Text("\(userExperiencePageModel.content.count)/")
                    .foregroundStyle(userExperiencePageModel.content.count == 0 ? Color.GrayC6C6C6 : Color.Gray4B4B4B)
                Text("500")
                    .foregroundStyle(Color.Gray9B9B9B)
            }
            .font(.regular(12))
            
            Spacer()
            
            CommonButton(title: "피드백 보내기")
                .enable(userExperiencePageModel.checkingContent())
                .tap {
                    focusField = nil
                    userExperiencePageModel.save {
                        toastPresenter.show(text: "접수되었습니다. 소중한 의견 감사합니다 :)")
                        router.navigateBack()
                    }
                }
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
}

#Preview {
    NavigationStack {
        UserExperiencePage()
    }
}


import Foundation
import Moya

enum AuthApi {
    enum SocialType: String {
        case kakao = "KAKAO"
        case google = "GOOGLE"
        case apple = "APPLE"
    }
    
    case reissueToken(requestModel: ReissueTokenRequestModel)
    case login(requetModel: AuthApiLoginRequestModel)
    case join(requetModel: JoinApiRequestModel)
}

extension AuthApi: TargetType {
    var baseURL: URL {
        guard let url = NetworkConstants.baseUrl.rawValue.toUrl else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/join"
            
        case .reissueToken:
            return "auth/reissue"
            
        case .join:
            return "auth/join"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let reqModel):
            return .requestParameters(parameters: reqModel.toTask(),
                                      encoding: JSONEncoding.default)
            
        case .join(let reqModel):
            return .requestParameters(parameters: reqModel.toTask(),
                                      encoding: JSONEncoding.default)
            
        case .reissueToken(let reqModel):
            return .requestParameters(parameters: reqModel.toTask(),
                                      encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return .init()
        }
    }
    
    
}

// MARK: - di
struct ReissueTokenRequestModel {
    let token: String
    
    func toTask() -> [String: Any] {
        var resultDic = [String: Any]()
        resultDic["token"] = token
        return resultDic
    }
}
struct JoinApiRequestModel {
    let userToken: String
    let nickname: String
    func toTask() -> [String: Any] {
        var resultDic = [String: Any]()
        resultDic["userToken"] = userToken
        resultDic["nickname"] = nickname
        return resultDic
    }
}
struct AuthApiLoginRequestModel {

    let socialType: AuthApi.SocialType
    let idToken: String?
    let authToken: String?
    let fcmToken: String?
    
    func toTask() -> [String: Any] {
        var resultDic = [String: Any]()
        resultDic["socialType"] = socialType.rawValue.uppercased()
        if let authToken = authToken {
            resultDic["authorizationCode"] = authToken
        }
        if let idToken = idToken {
            resultDic["idToken"] = idToken
        }
        if let fcmToken = fcmToken {
            resultDic["fcmToken"] = fcmToken
        }
        return resultDic
    }
}

extension AuthApi {
    
}

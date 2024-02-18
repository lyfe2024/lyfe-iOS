import Foundation

extension String {
    var toUrl: URL? {
        return .init(string: self)
    }
}

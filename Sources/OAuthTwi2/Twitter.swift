//
//  OAuthTwitter.swift
//
//
//  Created by devonly on 2021/12/03.
//

import Foundation
import Alamofire

final class Twitter {
    internal let redirectURL: String = "https://nyamotwi.firebaseapp.com/__/auth/handler"
    internal let clientId: String = "LU8yWHVMQkZyUmFSdG1CVmYzOWg6MTpjaQ"

    internal let authURL: URL {
        let ur: URL = URL(unsafeString: "https://twitter.com/i/oauth2/authorize")
        let parameters: [String: Any] = [
            "response_type": "code",
            "client_id": clientId,
            "redirect_uri": "",
            "state": "",
            "code_challenge": "",
            "code_challenge_method": "plain",
        ]
    }
}

extension Dictionary where Key == String, Value: LosslessStringConvertible {
    func asQueryItems() -> [URLQueryItem] {
        self.compactMap({ URLQueryItem(name: $0.key, value: String($0.value)) })
    }
}

extension URL {
    init(unsafeString: String) {
        self.init(string: unsafeString)!
    }

    func addQueryItems<T: LosslessStringConvertible>(_ parameters: [String: T]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        components.queryItems = queryItems + parameters.asQueryItems()
        return components.url
    }
}

extension URLComponents {
    init(unsafeString: String) {
        self.init(string: unsafeString)!
    }
}

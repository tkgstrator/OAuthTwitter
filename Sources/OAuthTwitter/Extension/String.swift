//
//  String.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import CryptoKit

extension String {
    func asDictionary() -> [String: Any] {
        self
            .components(separatedBy: "&").map({
                $0.components(separatedBy: "=")
            })
            .reduce(into: [String: Any](), { dict, pair in
                dict[pair[0]] = pair[1]
            })
    }
    
    var percentEncodedString: String {
        self.addingPercentEncoding(withAllowedCharacters: .alphanumerics.union(.init(charactersIn: "-._~") ))!
    }
    
    var base64EncodedString: String {
        (self.data(using: .utf8)?
            .base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_"))!
    }
    
    static var randomString: String {
        let baseString: [String] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~".map { String($0) }
        var randomString: String = ""
        for _ in Range(0...127) { randomString += baseString.randomElement() ?? "" }
        return randomString
    }
    
    var sha256: SHA256.Digest {
        SHA256.hash(data: Data(self.utf8))
    }
}

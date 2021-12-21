//
//  Parameters.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

extension Parameters {
    var queryURLEncodedString: String {
        self.sorted(by: { $0.key < $1.key }).compactMap({ ["\($0.key)", "\($0.value)".percentEncodedString].joined(separator: "=") }).joined(separator: "&")
    }
    
    var queryString: String {
        self.sorted(by: { $0.key < $1.key }).compactMap({ ["\($0.key)", "\($0.value)"].joined(separator: "=") }).joined(separator: "&")
    }
    
    var headerString: String {
        self.sorted(by: { $0.key < $1.key }).compactMap({ ["\($0.key)", "\($0.value)".percentEncodedString].joined(separator: "=") }).joined(separator: ",")
    }
    
    func merging(_ parameters: Parameters?) -> Parameters {
        guard let parameters = parameters else {
            return self
        }
        return parameters.merging(self) { $1 }
    }
}

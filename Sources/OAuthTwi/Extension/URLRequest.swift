//
//  URLRequest.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

extension URLRequest {
    internal var method: String {
        self.httpMethod!
    }
    
    internal var percentEncodedURLString: String {
        var components = URLComponents(string: self.url!.absoluteString)!
        components.query = nil
        return components.url!.absoluteString.percentEncodedString
    }
    
    internal var body: Parameters? {
        guard let httpBody = self.httpBody,
              let parameters = try? JSONSerialization.jsonObject(with: httpBody) as? [String: Any]
        else {
            return nil
        }
        return parameters
    }
    
    var urlEncodedString: Parameters? {
        guard let httpBody = self.httpBody else {
            return nil
        }
        return String(data: httpBody, encoding: .utf8)?.removingPercentEncoding?.asDictionary()
    }
}


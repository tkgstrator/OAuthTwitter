//
//  URL.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension URL {
    init(unsafeString: String) {
        self.init(string: unsafeString)!
    }
    
    var base64EncodedString: String {
        self.absoluteString.base64EncodedString
    }
    
    var percentEncodedString: String {
        self.absoluteString.percentEncodedString
    }
}

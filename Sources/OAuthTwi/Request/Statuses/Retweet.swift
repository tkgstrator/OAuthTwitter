//
//  Retweet.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Retweet: RequestType {
    typealias ResponseType = Response.Status
    
    var method: HTTPMethod = .post
    var path: String
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(id: String, trimUser: Bool) {
        self.path = "retweet/\(id).json"
        self.parameters = [
            "trim_user": trimUser.description
        ]
    }
}
    

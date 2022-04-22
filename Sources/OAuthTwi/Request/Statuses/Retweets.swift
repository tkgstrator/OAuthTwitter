//
//  Retweets.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Retweets: RequestType {
    typealias ResponseType = Response.Status
    
    var method: HTTPMethod = .get
    var path: String
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(id: String, count: Int, trimUser: Bool) {
        self.path = "retweets/\(id).json"
        self.parameters = [
            "count": count,
            "trim_user": trimUser.description
        ]
    }
}

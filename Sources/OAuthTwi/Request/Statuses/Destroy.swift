//
//  Destroy.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//
//  API Docs
//  https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id

import Foundation
import Alamofire

final class Destroy: RequestType {
    typealias ResponseType = Response.Status
    
    var method: HTTPMethod = .post
    var path: String
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(
        id: String,
        trimUser: Bool
    ) {
        self.path = "/destroy/\(id).json"
        self.parameters = [
            "id": id,
            "trim_user": trimUser.description,
        ]
    }
}

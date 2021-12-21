//
//  RetweetsOfMe.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class RetweetofMe: RequestType {
    typealias ResponseType = Response.Status
    
    var method: HTTPMethod = .get
    var path: String = "retweet_of_me.json"
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(count: Int, sinceId: Int64, maxId: Int64, includeEntities: Bool, includeUserEntities: Bool) {
        self.parameters = [
            "since_id": sinceId,
            "max_id": maxId,
            "include_entities": includeEntities.description,
            "include_user_entities": includeUserEntities.description
        ]
    }
}

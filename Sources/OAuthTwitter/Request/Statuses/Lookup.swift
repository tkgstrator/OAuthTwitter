//
//  Lookup.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

//  API Docs
//  https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup

import Foundation
import Alamofire

final class Lookup: RequestType {
    typealias ResponseType = [Response.Status]
    
    var method: HTTPMethod = .get
    var path: String = "lookup.json"
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(
        id: [String],
        includeEntities: Bool,
        trimUser: Bool,
        map: Bool,
        includeExtAltText: Bool,
        includeCardUri: Bool
    ) {
        self.parameters = [
            "id": id,
            "include_entities": includeEntities.description,
            "trim_user": trimUser.description,
            "map": map.description,
            "include_ext_alt_text": includeExtAltText.description,
            "include_card_uri": includeCardUri.description
        ]
    }
}

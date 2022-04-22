//
//  Show.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//
//  API Docs
//  https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id

import Foundation
import Alamofire

final class Show: RequestType {
    typealias ResponseType = [Response.Status]
    
    var method: HTTPMethod = .get
    var path: String = "show.json"
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(
        id: [String],
        trimUser: Bool,
        includeMyRetweet: Bool,
        includeEntities: Bool,
        includeExtAltText: Bool,
        includeCardUri: Bool
    ) {
        self.parameters = [
            "id": id,
            "trim_user": trimUser.description,
            "include_my_retweet": includeMyRetweet.description,
            "include_entities": includeEntities.description,
            "include_ext_alt_text": includeExtAltText.description,
            "include_card_uri": includeCardUri.description
        ]
    }
}

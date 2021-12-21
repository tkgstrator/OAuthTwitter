//
//  Search.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Search: RequestType {
    typealias ResponseType = Response.Search
    
    var method: HTTPMethod = .get
    var path: String = "tweets.json"
    var resource: Resource = .search
    var parameters: Parameters?
    
    init(context: String, count: Int) {
        self.parameters = [
            "q": context,
            "count": count
        ]
    }
}

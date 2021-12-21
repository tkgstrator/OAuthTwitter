//
//  Credential.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Credential: RequestType {
    typealias ResponseType = Response.User
    
    var method: HTTPMethod = .get
    var path: String = "verify_credentials.json"
    var resource: Resource = .account
    var parameters: Parameters?
    
    init(includeEntities: Bool, skipStatus: Bool, includeEmail: Bool) {
        self.parameters = [
            "include_entities": includeEntities,
            "skipStatus": skipStatus,
            "includeEmail": includeEmail
        ]
    }
}

//
//  Blocks.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Blocks {
    final class Create: RequestType {
        typealias ResponseType = Response.User
        
        var method: HTTPMethod = .post
        var path: String = "create.json"
        var resource: Resource = .blocks
        var parameters: Parameters?
        
        init(screenName: String, userId: String?, includeEntities: Bool, skipStatus: Bool) {
            self.parameters = [
                "screen_name": screenName,
                "user_id": userId,
                "include_entities": includeEntities.description,
                "skip_status": skipStatus.description
            ].compactMapValues({ $0 })
        }
    }
    
    final class Destroy: RequestType {
        typealias ResponseType = Response.User
        
        var method: HTTPMethod = .post
        var path: String = "create.json"
        var resource: Resource = .blocks
        var parameters: Parameters?
        
        init(screenName: String, userId: String?, includeEntities: Bool, skipStatus: Bool) {
            self.parameters = [
                "screen_name": screenName,
                "user_id": userId,
                "include_entities": includeEntities.description,
                "skip_status": skipStatus.description
            ].compactMapValues({ $0 })
        }
    }
    
    final class List: RequestType {
        typealias ResponseType = Response.User
        
        var method: HTTPMethod = .get
        var path: String = "list.json"
        var resource: Resource = .blocks
        var parameters: Parameters?
        
        init(includeEntities: Bool, skip_status: Bool, cursor: Int = -1) {
            self.parameters = [
                "include_entities": includeEntities.description,
                "skip_status": skip_status.description,
                "cursor": cursor
            ]
        }
    }
    
    final class Ids: RequestType {
        typealias ResponseType = Response.User
        
        var method: HTTPMethod = .get
        var path: String = "list.json"
        var resource: Resource = .blocks
        var parameters: Parameters?
        
        init(stringfyIds: Bool, cursor: String) {
            self.parameters = [
                "stringfy_ids": stringfyIds.description,
                "cursor": cursor
            ]
        }
    }
}

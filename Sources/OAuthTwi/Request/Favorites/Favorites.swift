//
//  Favorites.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Favorites {
    final class Create: RequestType {
        typealias ResponseType = Response.Status
        
        var method: HTTPMethod = .post
        var path: String = "create.json"
        var resource: Resource = .favorites
        var parameters: Parameters?
        
        init(id: String, includeEntities: Bool) {
            self.parameters = [
                "id": id,
                "include_entities": includeEntities.description
            ]
        }
    }
    
    final class Destroy: RequestType {
        typealias ResponseType = Response.Status
        
        var method: HTTPMethod = .post
        var path: String = "destroy.json"
        var resource: Resource = .favorites
        var parameters: Parameters?
        
        init(id: String, includeEntities: Bool) {
            self.parameters = [
                "id": id,
                "include_entities": includeEntities.description
            ]
        }
    }
    
    final class List: RequestType {
        typealias ResponseType = Response.Status
        
        var method: HTTPMethod = .post
        var path: String = "destroy.json"
        var resource: Resource = .favorites
        var parameters: Parameters?
        
        init(id: String, includeEntities: Bool) {
            self.parameters = [
                "id": id,
                "include_entities": includeEntities.description
            ]
        }
    }
}

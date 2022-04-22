//
//  Timeline.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

public final class Timeline {
    final class Home: RequestType {
        typealias ResponseType = [Response.Status]
        
        var method: HTTPMethod = .get
        var path: String = "home_timeline.json"
        var resource: Resource = .statuses
        var parameters: Parameters?
        
        init(count: Int) {
            self.parameters = [
                "count": count,
            ]
        }
    }

    final class Mentions: RequestType {
        typealias ResponseType = [Response.Status]
        
        var method: HTTPMethod = .get
        var path: String = "mentions_timeline.json"
        var resource: Resource = .statuses
        var parameters: Parameters?
        
        init(count: Int) {
            self.parameters = [
                "count": count,
            ]
        }
    }
    
    final class User: RequestType {
        typealias ResponseType = [Response.Status]
        
        var method: HTTPMethod = .get
        var path: String = "user_timeline.json"
        var resource: Resource = .statuses
        var parameters: Parameters?
        
        init(screenName: String, count: Int) {
            self.parameters = [
                "screen_name": screenName,
                "count": count,
            ]
        }
    }
}

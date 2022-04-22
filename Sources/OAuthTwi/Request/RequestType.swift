//
//  RequestType.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestType: URLRequestConvertible {
    associatedtype ResponseType: Codable
    
    var method: HTTPMethod { get }
    var path: String { get }
    var baseURL: URL { get }
    var resource: Resource { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension RequestType {
    var baseURL: URL {
        URL(unsafeString: "https://api.twitter.com/1.1/")
    }
    
    var encoding: ParameterEncoding {
        URLEncoding.queryString
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(resource.rawValue).appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
        if let parameters = parameters {
            request = try encoding.encode(request, with: parameters)
        }
        return request
    }
}

enum Resource: String, CaseIterable {
    case statuses
    case mutes
    case search
    case favorites
    case blocks
    case account
}

//
//  RequestType.swift
//  
//
//  Created by devonly on 2022/04/22.
//  
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
        URL(unsafeString: "https://api.twitter.com/2/")
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
    case tweets
    case users
}

//
//  OAuthTwitter.swift
//
//
//  Created by devonly on 2021/12/03.
//

import Foundation
import CryptoKit
import Alamofire
import Combine

public class TWSession: RequestInterceptor {
    private var consumerKey: String?
    private var consumerKeySecret: String?
    private var accessToken: String?
    private var accessTokenSecret: String?

    public static let session: TWSession = TWSession()

    internal init() {}

    internal let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    public func configure(consumerKey: String, consumerKeySecret: String, accessToken: String, accessTokenSecret: String) {
        self.consumerKey = consumerKey
        self.consumerKeySecret = consumerKeySecret
        self.accessToken = accessToken
        self.accessTokenSecret = accessTokenSecret
    }

    public func configure(consumerKey: String, consumerKeySecret: String) {
        self.consumerKey = consumerKey
        self.consumerKeySecret = consumerKeySecret
    }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let consumerKey = consumerKey,
              let consumerKeySecret = consumerKeySecret,
              let accessToken = accessToken,
              let accessTokenSecret = accessTokenSecret
        else {
            completion(.failure(AFError.sessionDeinitialized))
            return
        }
        var request = urlRequest
        let queryString: [String: Any]? = urlRequest.url?.query?.asDictionary()
        
        // Merge parameters
        var parameters: Parameters = [
            "oauth_consumer_key": consumerKey,
            "oauth_token": accessToken,
            "oauth_signature_method": "HMAC-SHA1",
            "oauth_timestamp": Int(Date().timeIntervalSince1970),
            "oauth_nonce": String.randomString,
            "oauth_version": "1.0",
        ]
            .merging(queryString)
        
        // Calcurate Signature from HTTPHeaders
        let signatureData: String = [request.method, request.percentEncodedURLString, parameters.queryString.percentEncodedString].joined(separator: "&")
        let signatureKey = [consumerKeySecret, accessTokenSecret].joined(separator: "&")
        let signature = hmacHash(signatureKey: signatureKey, signatureData: signatureData)
        
        // Add Signature of HMAC-SHA1
        parameters = parameters.merging(["oauth_signature": signature])
        request.headers.add(.authorization("OAuth \(parameters.headerString)"))
        completion(.success(request))
    }
    
    internal func publish<T: RequestType>(_ request: T) -> AnyPublisher<T.ResponseType, AFError> {
        AF.request(request, interceptor: self)
            .validate()
            .publishDecodable(type: T.ResponseType.self, decoder: decoder)
            .value()
    }
    
    internal func hmacHash(signatureKey: String, signatureData: String) -> String {
        let hash = HMAC<Insecure.SHA1>.authenticationCode(for: Data(signatureData.data(using: .utf8)!), using: SymmetricKey(data: Data(signatureKey.data(using: .utf8)!)))
        let hashArray: [UInt8] = Array(hash.map{ String(format: "%02x", $0) }).map{ UInt8($0, radix: 16)! }
        let data: Data = Data(bytes: hashArray, count: hashArray.count)
        return data.base64EncodedString()
    }
}


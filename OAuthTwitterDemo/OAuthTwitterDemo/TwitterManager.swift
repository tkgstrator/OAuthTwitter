//
//  TwitterManager.swift
//  OAuthTwitterDemo
//
//  Created by devonly on 2021/12/21.
//

import Foundation
import OAuthTwitter
import Combine

final class TwitterManager: ObservableObject {
    @Published var timeline: [Response.Status] = []
    private var task = Set<AnyCancellable>()
    
    internal var statuses: OAuthPublisher.Statuses
    
    init() {
        self.statuses = OAuthPublisher.Statuses(consumerKey: "", consumerKeySecret: "", accessToken: "", accssTokenSecret: "")
    }
    
    internal func setCredential(
        consumerKey: String,
        consumerKeySecret: String,
        accessToken: String,
        accessTokenSecret: String
    ) {
        self.statuses = OAuthPublisher.Statuses(consumerKey: consumerKey, consumerKeySecret: consumerKeySecret, accessToken: accessToken, accssTokenSecret: accessTokenSecret)
    }
    
    func getHomeTimeline() {
        statuses.homeTimeline()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [self] response in
                timeline = response
            })
            .store(in: &task)
    }
}

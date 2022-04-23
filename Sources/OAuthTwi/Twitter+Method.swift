//
//  Twitter+Method.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import CloudKit

extension TWSession {
    public enum Statuses {
        /// Updates the authenticating user's current status, also known as Tweeting.
        public func update(
            status: String,
            inReplyToStatusId: String? = nil
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(Update(status: status, inReplyToStatusId: inReplyToStatusId))
        }
        
        /// Destroys the status specified by the required ID parameter.
        public func destroy(id: String, trimUser: Bool) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(Destroy(id: id, trimUser: trimUser))
        }
        
        /// Returns a single Tweet, specified by the id parameter.
        public func show(
            id: [String],
            trimUser: Bool = false,
            includeMyRetweet: Bool = false,
            includeEntities: Bool = false,
            includeExtAltText: Bool = false,
            includeCardUri: Bool = false
        ) -> AnyPublisher<[Response.Status], AFError> {
            TWSession.session.publish(Show(id: id, trimUser: trimUser, includeMyRetweet: includeMyRetweet, includeEntities: includeEntities, includeExtAltText: includeExtAltText, includeCardUri: includeCardUri))
        }
        
        /// Returns fully-hydrated Tweet objects for up to 100 Tweets per request, as specified by comma-separated values passed to the id parameter.
        public func lookup(
            id: [String],
            includeEntities: Bool = false,
            trimUser: Bool = false,
            map: Bool = false,
            includeExtAltText: Bool = false,
            includeCardUri: Bool = false
        )
        -> AnyPublisher<[Response.Status], AFError> {
            TWSession.session.publish(Lookup(id: id, includeEntities: includeEntities, trimUser: trimUser, map: map, includeExtAltText: includeExtAltText, includeCardUri: includeCardUri))
        }
        
        /// Retweets a tweet. Returns the original Tweet with Retweet details embedded.
        public func retweet(
            id: String,
            trimUser: Bool = false
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(Retweet(id: id, trimUser: trimUser))
        }
        
        /// Untweets a retweeted status. Returns the original Tweet with Retweet details embedded.
        public func unretweet(
            id: String,
            trimUser: Bool = false
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(Unretweet(id: id, trimUser: false))
        }
        
        /// Returns a collection of the 100 most recent retweets of the Tweet specified by the id parameter.
        public func retweets(
            id: String,
            count: Int,
            trimUser: Bool = false
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(Retweets(id: id, count: count, trimUser: trimUser))
        }
        
        /// Returns the most recent Tweets authored by the authenticating user that have been retweeted by others.
        public func retweetsOfMe(
            count: Int,
            sinceId: Int64,
            maxId: Int64,
            includeEntities: Bool = false,
            includeUserEntities: Bool = false
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(RetweetofMe(count: count, sinceId: sinceId, maxId: maxId, includeEntities: includeEntities, includeUserEntities: includeUserEntities))
        }
        
        /// Returns a collection of up to 100 user IDs belonging to users who have retweeted the Tweet specified by the id parameter.
        public func retweeters(
            id: String,
            count: Int,
            cursor: String,
            stringfyIds: Bool = false
        )
        -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(Retweeters(id: id, count: count, cursor: cursor, stringfyIds: stringfyIds))
        }
        
        /// Returns a collection of the most recent Tweets and Retweets posted by the authenticating user and the users they follow. The home timeline is central to how most users interact with the Twitter service.
        public func homeTimeline(
            count: Int = 20
        ) -> AnyPublisher<[Response.Status], AFError> {
            TWSession.session.publish(Timeline.Home(count: count))
        }
        
        /// Returns a collection of the most recent Tweets posted by the user indicated by the screen_name or user_id parameters.
        public func userTimeline(
            screenName: String,
            count: Int = 20
        ) -> AnyPublisher<[Response.Status], AFError> {
            TWSession.session.publish(Timeline.User(screenName: screenName, count: count))
        }
        
        /// Returns the 20 most recent mentions (Tweets containing a users's @screen_name) for the authenticating user.
        public func mentionsTimeline(
            count: Int = 20
        ) -> AnyPublisher<[Response.Status], AFError> {
            TWSession.session.publish(Timeline.Mentions(count: count))
        }
    }
    
    public enum Favorites {
        /// Favorites (likes) the Tweet specified in the ID parameter as the authenticating user. Returns the favorite Tweet when successful.
        public func create(
            id: String,
            includeEntities: Bool = false
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(OAuthTwi.Favorites.Create(id: id, includeEntities: includeEntities))
        }
        
        /// Unfavorites (un-likes) the Tweet specified in the ID parameter as the authenticating user. Returns the un-liked Tweet when successful.
        public func destroy(
            id: String,
            includeEntities: Bool = false
        ) -> AnyPublisher<Response.Status, AFError> {
            TWSession.session.publish(OAuthTwi.Favorites.Destroy(id: id, includeEntities: includeEntities))
        }
    }
    
    public class Search {
        /// Returns a collection of relevant Tweets matching a specified query.
        public func tweets(
            context: String,
            count: Int = 15
        ) -> AnyPublisher<Response.Search, AFError> {
            TWSession.session.publish(OAuthTwi.Search(context: context, count: count))
        }
    }
    
    public enum Blocks {
        /// Blocks the specified user from following the authenticating user.
        public func create(
            screenName: String,
            userId: String?,
            includeEntities: Bool = false,
            skipStatus: Bool = false
        ) -> AnyPublisher<Response.User, AFError> {
            TWSession.session.publish(OAuthTwi.Blocks.Create(screenName: screenName, userId: userId, includeEntities: includeEntities, skipStatus: skipStatus) )
        }
    }
    
    public enum Account {
        public func getUserCredentials() -> AnyPublisher<Response.User, AFError> {
            TWSession.session.publish(Credential(includeEntities: false, skipStatus: true, includeEmail: false))
        }
    }
}

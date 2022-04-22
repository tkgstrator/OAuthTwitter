//
//  Tweets.swift
//  
//
//  Created by devonly on 2022/04/22.
//  
//

import Foundation
import Alamofire

public enum Tweets {
    final public class TweetsLookup: RequestType {
        typealias ResponseType = Response

        var method: HTTPMethod = .get
        var path: String
        var resource: Resource = .tweets
        var parameters: Parameters?

        init(id: Int) {
            self.path = "\(id)"
        }

        init() {}

        public struct Response: Codable {}
    }

    final public class TweetsPost: RequestType {
        typealias ResponseType = Response

        var method: HTTPMethod = .post
        var path: String
        var resource: Resource = .tweets
        var parameters: Parameters?

        init() {}

        public struct Response: Codable {}
    }

    final public class TweetsDelete: RequestType {
        typealias ResponseType = Response

        var method: HTTPMethod = .delete
        var path: String
        var resource: Resource = .tweets
        var parameters: Parameters?

        init(id: Int) {
            self.path = "\(id)"
        }

        public struct Response: Codable {}
    }

    final public class SearchTweets: RequestType {
        typealias ResponseType = Response

        var method: HTTPMethod = .get
        var path: String
        var resource: Resource = .tweets
        var parameters: Parameters?

        init() {
            self.path = "search/recent"
        }

        public struct Response: Codable {}
    }

    final public class TweetsCount: RequestType {
        typealias ResponseType = Response

        var method: HTTPMethod = .get
        var path: String
        var resource: Resource = .tweets
        var parameters: Parameters?

        init() {
            self.path = "counts/recent"
        }

        public struct Response: Codable {}
    }

    public enum FilteredStream {
        final public class Create: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .post
            var path: String
            var resource: Resource = .tweets
            var parameters: Parameters?

            init() {
                self.path = "search/stream/rules"
            }

            public struct Response: Codable {}
        }

        final public class FindAll: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .get
            var path: String
            var resource: Resource = .tweets
            var parameters: Parameters?

            init() {
                self.path = "search/stream/rules"
            }

            public struct Response: Codable {}
        }

        final public class Find: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .get
            var path: String
            var resource: Resource = .tweets
            var parameters: Parameters?

            init() {
                self.path = "search/stream"
            }

            public struct Response: Codable {}
        }
    }

    public enum Retweets {
        public enum Lookup {
            final public class Retweeted: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .get
                var path: String
                var resource: Resource = .tweets
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/retweeted_by"
                }

                public struct Response: Codable {}
            }

            final public class Quote: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .get
                var path: String
                var resource: Resource = .tweets
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/quote_tweets"
                }

                public struct Response: Codable {}
            }
        }

        public enum Manage {
            final public class Create: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .post
                var path: String
                var resource: Resource = .tweets
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/quote_tweets"
                }

                public struct Response: Codable {}
            }

            final public class Delete: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .delete
                var path: String
                var resource: Resource = .tweets
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/retweets/\(id)"
                }

                public struct Response: Codable {}
            }
        }

        public enum Likes {
            public enum Lookup {
                final public class LikingUsers: RequestType {
                    typealias ResponseType = Response

                    var method: HTTPMethod = .get
                    var path: String
                    var resource: Resource = .tweets
                    var parameters: Parameters?

                    init(id: Int) {
                        self.path = "\(id)/liking_users"
                    }

                    public struct Response: Codable {}
                }

                final public class LikedTweets: RequestType {
                    typealias ResponseType = Response

                    var method: HTTPMethod = .get
                    var path: String
                    var resource: Resource = .users
                    var parameters: Parameters?

                    init(id: Int) {
                        self.path = "\(id)/liked_tweets"
                    }

                    public struct Response: Codable {}
                }
            }

            public enum Manage {
                final public class Likes: RequestType {
                    typealias ResponseType = Response

                    var method: HTTPMethod = .post
                    var path: String
                    var resource: Resource = .users
                    var parameters: Parameters?

                    init(id: Int) {
                        self.path = "\(id)/likes"
                    }

                    public struct Response: Codable {}
                }

                final public class Unlikes: RequestType {
                    typealias ResponseType = Response

                    var method: HTTPMethod = .delete
                    var path: String
                    var resource: Resource = .users
                    var parameters: Parameters?

                    init(id: Int) {
                        self.path = "\(id)/likes/\(id)"
                    }

                    public struct Response: Codable {}
                }
            }
        }

        final public class Hide: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .put
            var path: String
            var resource: Resource = .tweets
            var parameters: Parameters?

            init(id: Int) {
                self.path = "\(id)/hidden"
            }

            public struct Response: Codable {}
        }
    }
}

//
//  Users.swift
//  
//
//  Created by devonly on 2022/04/22.
//  
//

import Foundation
import Alamofire

public enum Users {
    final public class Timeline: RequestType {
        typealias ResponseType = Response

        var method: HTTPMethod = .get
        var path: String
        var resource: Resource = .users
        var parameters: Parameters?

        init(tweetId: Int) {
            self.path = "\(id)/tweets"
        }

        init(mentionId: Int) {
            self.path = "\(id)/mentions"
        }

        public struct Response: Codable {}
    }

    public enum Lookup {
        final public class FindMe: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .get
            var path: String = "me"
            var resource: Resource = .users
            var parameters: Parameters?

            init() {}

            public struct Response: Codable {}
        }

        final public class FindAll: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .get
            var path: String
            var resource: Resource = .users
            var parameters: Parameters?

            init() {}

            public struct Response: Codable {}
        }

        final public class FindById: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .get
            var path: String
            var resource: Resource = .users
            var parameters: Parameters?

            init() {}

            public struct Response: Codable {}
        }

        final public class FindByName: RequestType {
            typealias ResponseType = Response

            var method: HTTPMethod = .get
            var path: String
            var resource: Resource = .users
            var parameters: Parameters?

            init() {}

            public struct Response: Codable {}
        }
    }

    public enum Folows {
        public enum Lookup {
            final public class Following: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .get
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/following"
                }

                init(username: String) {
                    self.path = "by/username/\(username)/following"
                }

                public struct Response: Codable {}
            }

            final public class Followers: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .get
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/followwers"
                }

                init(username: String) {
                    self.path = "by/username/\(username)/followers"
                }

                public struct Response: Codable {}
            }
        }

        public enum Manage {
            final public class Follow: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .post
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/following"
                }

                public struct Response: Codable {}
            }

            final public class Unfollow: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .delete
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/following"
                }

                public struct Response: Codable {}
            }
        }
    }

    public enum Blocks {
        public enum Lookup {
            final public class Blocking: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .get
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/blocking"
                }

                public struct Response: Codable {}
            }
        }

        public enum Manage {
            final public class Block: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .post
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/blocking"
                }

                public struct Response: Codable {}
            }

            final public class Unblock: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .delete
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/blocking"
                }

                public struct Response: Codable {}
            }
        }
    }

    public enum Mutes {
        public enum Lookup {
            final public class Muting: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .get
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/muting"
                }

                public struct Response: Codable {}
            }
        }

        public enum Manage {
            final public class Mute: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .post
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/muting"
                }

                public struct Response: Codable {}
            }

            final public class Unmute: RequestType {
                typealias ResponseType = Response

                var method: HTTPMethod = .delete
                var path: String
                var resource: Resource = .users
                var parameters: Parameters?

                init(id: Int) {
                    self.path = "\(id)/muting"
                }

                public struct Response: Codable {}
            }
        }
    }
}

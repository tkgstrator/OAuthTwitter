# OAuthTwitter

OAuthTwitter is a Twitter framework that is fully compatible with Swift Combine with using Alamofire.

## Installation

### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Add the following line to the dependencies in your Package.swift file:

```
.package(url: "https://github.com/tkgstrator/OAuthTwitter.git", .upToNextMajor(from: "0.0.1"))
```

Next, add BetterSafariView as a dependency for your targets:

```
.target(name: "MyTarget", dependencies: ["OAuthTwitter"])
```

### Xcode

Select File > Swift Packages > Add Package Dependency, then enter the following URL:

```
https://github.com/tkgstrator/OAuthTwitter.git
```

For more details, see [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

## Get Started

### Usage

OAuthTwitter used Twitter's OAuth Consumer Key and Secret.

```
let connection = Twitter(consumerKey: CONSUMER_KEY, consumerKeySecret: CONSUMER_KEY_SECRET, accessToken: ACCESS_TOKEN, accessTokenSecret: ACCESS_TOKEN_SECRET)
```

These credentials can be obtained from the [Twitter App Developer Portal](https://developer.twitter.com/en/portal/).

## Example Requests

### Get Home Timeline:

```swift
connection.homeTimeline()
    .sink(receiveCompletion: { completion in
        switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
        }
    }, receiveValue: { response in
    })
    .store(in: &task)
```

## Supported API

|         | Twitter API v2 | Standard v1.1 | Premium v1.1 | Enterprise Gnip 2.0 |
| :-----: | :------------: | :-----------: | :----------: | :-----------------: |
| Support |    Not yet     |   Partially   |      No      |         No          |

### Supported Method

|  Tweets   | Supported |
| :-------: | :-------: |
|  Account  |    No     |
|  Search   | Parially  |
|   Post    |    Yes    |
| Timeline  |    Yes    |
| Favorites |    Yes    |
|  Blocks   | Parially  |
|   Mutes   |    No     |
|   User    |    No     |
|    DM     |    No     |
|   Media   |    No     |
|   Trend   |    No     |
| Location  |    No     |
|    Geo    |    No     |

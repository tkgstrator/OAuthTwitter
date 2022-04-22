//
//  OAuthTwitterDemoApp.swift
//  OAuthTwitterDemo
//
//  Created by devonly on 2021/12/21.
//

import SwiftUI

@main
struct OAuthTwitterDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TwitterService())
        }
    }
}

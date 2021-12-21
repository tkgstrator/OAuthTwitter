//
//  ContentView.swift
//  OAuthTwitterDemo
//
//  Created by devonly on 2021/12/21.
//

import SwiftUI
import OAuthTwitter

struct ContentView: View {
    @EnvironmentObject var manager: TwitterManager
    @AppStorage("APP_CONSUMER_KEY") var consumerKey: String = ""
    @AppStorage("APP_CONSUMER_KEY_SECRET") var consumerKeySecret: String = ""
    @AppStorage("APP_ACCESS_TOKEN") var accessToken: String = ""
    @AppStorage("APP_ACCESS_TOKEN_SECRET") var accessTokenSecret: String = ""
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section(content: {
                    TextField("ConsumerKey", text: $consumerKey, prompt: nil)
                    TextField("ConsumerKeySecret", text: $consumerKeySecret, prompt: nil)
                    TextField("AccessToken", text: $accessToken, prompt: nil)
                    TextField("AccessTokenSecret", text: $accessTokenSecret, prompt: nil)
                    Button(action: {
                        manager.setCredential(consumerKey: consumerKey, consumerKeySecret: consumerKeySecret, accessToken: accessToken, accessTokenSecret: accessTokenSecret)
                    }, label: {
                        Text("Connect")
                    })
                }, header: {
                    Text("Credential")
                })
                Section(content: {
                    Button(action: {
                        manager.getHomeTimeline()
                    }, label: {
                        Text("Home Timeline")
                    })
                }, header: {
                    Text("Request")
                })
                Section(content: {
                    ForEach(manager.timeline) { tweet in
                        Text(tweet.text)
                            .lineLimit(1)
                    }
                }, header: {
                    Text("Timeline")
                })
            })
            .navigationTitle("OAuthTwitter")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

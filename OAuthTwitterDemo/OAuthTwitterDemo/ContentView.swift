//
//  ContentView.swift
//  OAuthTwitterDemo
//
//  Created by devonly on 2021/12/21.
//

import SwiftUI
import OAuthTwi

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            Form(content: {
                NavigationLink(destination: OAuth1View(), label: {
                    Text("v1.1 ACCESS")
                })
                NavigationLink(destination: OAuth2View(), label: {
                    Text("v2 ACCESS")
                })
            })
            .navigationTitle("OAuthTwitter Demo")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

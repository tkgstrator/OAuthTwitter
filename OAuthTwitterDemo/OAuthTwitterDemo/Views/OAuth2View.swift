//
//  OAuth2View.swift
//  OAuthTwitterDemo
//
//  Created by devonly on 2022/04/22.
//  Copyright © 2022 Magi Corporation. All rights reserved.
//

import SwiftUI

struct OAuth2View: View {
    @SceneStorage("APP_CONSUMER_KEY") var consumerKey: String = ""
    @SceneStorage("APP_CONSUMER_KEY_SECRET") var consumerKeySecret: String = ""
    @SceneStorage("APP_ACCESS_TOKEN") var accessToken: String = ""
    @SceneStorage("APP_ACCESS_TOKEN_SECRET") var accessTokenSecret: String = ""

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OAuth2View_Previews: PreviewProvider {
    static var previews: some View {
        OAuth2View()
    }
}

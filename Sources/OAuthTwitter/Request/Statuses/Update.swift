//
//  Update.swift
//  OAuthTwitter
//
//  Created by devonly on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

final class Update: RequestType {
    typealias ResponseType = Response.Status
    
    var method: HTTPMethod = .post
    var path: String = "update.json"
    var resource: Resource = .statuses
    var parameters: Parameters?
    
    init(
        status: String,
        inReplyToStatusId: String? = nil,
        autoPopulateReplyMetadata: Bool? = nil,
        excludeReplyUserIds: [String]? = nil,
        attachmentUrl: String? = nil,
        mediaIds: [String]? = nil,
        possiblySensitive: Bool? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        placeId: String? = nil,
        displayCoordinates: Bool? = nil,
        trimUser: Bool? = nil,
        enableDmcommands: Bool? = nil,
        failDmcommands: Bool? = nil,
        cardUri: String? = nil
    ) {
        let queryParameters: [String: Any?] = [
            "status": status,
            "in_reply_to_status_id": inReplyToStatusId,
            "auto_populate_reply_metadata": autoPopulateReplyMetadata,
            "exclude_reply_user_ids": excludeReplyUserIds,
            "attachment_url": attachmentUrl,
            "media_ids": mediaIds,
            "possibly_sensitive": possiblySensitive,
            "lat": latitude,
            "long": longitude,
            "display_coordinates": displayCoordinates,
            "trim_user": trimUser,
            "enable_dmcommands": enableDmcommands,
            "fail_dmcommands": failDmcommands,
            "card_uri": cardUri
        ]
        self.parameters = queryParameters.compactMapValues({ $0 })
    }
}

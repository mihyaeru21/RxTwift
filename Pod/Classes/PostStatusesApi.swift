//
//  PostStatusesApi.swift
//  Pods
//
//  Created by Mihyaeru on 3/5/16.
//
//

import Foundation
import RxSwift

public class PostStatusesApi {
    internal let client: Client
    internal init(client: Client) {
        self.client = client
    }

    // https://dev.twitter.com/rest/reference/post/statuses/update
    public func update(
        status status:      String,
        inReplyToStatusId:  Int64?   = nil,
        possiblySensitive:  Bool?    = nil,
        lat:                Float?   = nil,
        long:               Float?   = nil,
        placeId:            String?  = nil,
        displayCoordinates: Bool?    = nil,
        trimUser:           Bool?    = nil,
        mediaIds:           [Int64]? = nil
    ) -> Observable<Tweet> {
        return self.client.post("/statuses/update.json", params: Dictionary.createWithNotNil(
            "status"               .by(status),
            "in_reply_to_status_id".by(inReplyToStatusId),
            "possibly_sensitive"   .by(possiblySensitive),
            "lat"                  .by(lat),
            "long"                 .by(long),
            "place_id"             .by(placeId),
            "display_coordinates"  .by(displayCoordinates),
            "trim_user"            .by(trimUser),
            "media_ids"            .by(mediaIds?.joinedString)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/post/statuses/destroy/%3Aid
    public func destroy(
        id id:    Int64,
        trimUser: Bool? = nil
    ) -> Observable<Tweet> {
        return self.client.post("/statuses/destroy/\(id).json", params: Dictionary.createWithNotNil(
            "trim_user".by(trimUser)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/post/statuses/retweet/%3Aid
    public func retweet(
        id id:    Int64,
        trimUser: Bool? = nil
    ) -> Observable<Tweet> {
        return self.client.post("/statuses/retweet/\(id).json", params: Dictionary.createWithNotNil(
            "trim_user".by(trimUser)
        )).decode()
    }
}
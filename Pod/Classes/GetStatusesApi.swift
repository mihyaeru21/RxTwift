//
//  GetStatusesApi.swift
//  Pods
//
//  Created by Mihyaeru on 3/2/16.
//
//

import Foundation
import RxSwift

public class GetStatusesApi {
    internal let client: Client
    internal init(client: Client) {
        self.client = client
    }

    // https://dev.twitter.com/rest/reference/get/statuses/show/%3Aid
    public func show(
        id id:            Int64,
        trimUser:         Bool? = nil,
        includeMyRetweet: Bool? = nil,
        includeEntities:  Bool? = nil
    ) -> Observable<Tweet> {
        return self.client.get("/statuses/show.json", params: Dictionary.createWithNotNil(
            "id"                .by(id),
            "trim_user"         .by(trimUser),
            "include_my_retweet".by(includeMyRetweet),
            "include_entities"  .by(includeEntities)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/get/statuses/lookup
    public func lookup(
        ids ids:          [Int64],
        trimUser:         Bool?  = nil,
        includeEntities:  Bool?  = nil
    ) -> Observable<Tweet> {
        if ids.count < 1 {
            return Observable.empty()
        }
        return self.client.get("/statuses/lookup.json", params: Dictionary.createWithNotNil(
            "id"              .by(ids.map({ $0.description }).joinWithSeparator(",")),
            "trim_user"       .by(trimUser),
            "include_entities".by(includeEntities)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/statuses/home_timeline
    public func homeTimeline(
        count count:        Int?   = nil,
        sinceId:            Int64? = nil,
        maxId:              Int64? = nil,
        trimUser:           Bool?  = nil,
        excludeReplies:     Bool?  = nil,
        contributorDetails: Bool?  = nil,
        includeEntities:    Bool?  = nil
    ) -> Observable<Tweet> {
        return self.client.get("/statuses/home_timeline.json", params: Dictionary.createWithNotNil(
            "count"              .by(count),
            "since_id"           .by(sinceId),
            "max_id"             .by(maxId),
            "trim_user"          .by(trimUser),
            "exclude_replies"    .by(excludeReplies),
            "contributor_details".by(contributorDetails),
            "include_entities"   .by(includeEntities)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/statuses/mentions_timeline
    public func mentionsTimeline(
        count count:        Int?   = nil,
        sinceId:            Int64? = nil,
        maxId:              Int64? = nil,
        trimUser:           Bool?  = nil,
        contributorDetails: Bool?  = nil,
        includeEntities:    Bool?  = nil
    ) -> Observable<Tweet> {
        return self.client.get("/statuses/mentions_timeline.json", params: Dictionary.createWithNotNil(
            "count"              .by(count),
            "since_id"           .by(sinceId),
            "max_id"             .by(maxId),
            "trim_user"          .by(trimUser),
            "contributor_details".by(contributorDetails),
            "include_entities"   .by(includeEntities)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/statuses/user_timeline
    public func userTimeline(
        userId userId:      Int64?  = nil,
        screenName:         String? = nil,
        count:              Int?    = nil,
        sinceId:            Int64?  = nil,
        maxId:              Int64?  = nil,
        trimUser:           Bool?   = nil,
        excludeReplies:     Bool?   = nil,
        contributorDetails: Bool?   = nil,
        includeRts:         Bool?   = nil
    ) -> Observable<Tweet> {
        return self.client.get("/statuses/user_timeline.json", params: Dictionary.createWithNotNil(
            "user_id"            .by(userId),
            "screen_name"        .by(screenName),
            "count"              .by(count),
            "since_id"           .by(sinceId),
            "max_id"             .by(maxId),
            "trim_user"          .by(trimUser),
            "exclude_replies"    .by(excludeReplies),
            "contributor_details".by(contributorDetails),
            "include_rts"        .by(includeRts)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/statuses/retweets/%3Aid
    public func retweets(
        id id:    Int64,
        count:    Int?  = nil,
        trimUser: Bool? = nil
    ) -> Observable<Tweet> {
        return self.client.get("/statuses/retweets/\(id).json", params: Dictionary.createWithNotNil(
            "count"    .by(count),
            "trim_user".by(trimUser)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/statuses/retweets_of_me
    public func retweetsOfMe(
        count count:         Int?   = nil,
        sinceId:             Int64? = nil,
        maxId:               Int64? = nil,
        trimUser:            Bool?  = nil,
        includeEntities:     Bool?  = nil,
        includeUserEntities: Bool?  = nil
    ) -> Observable<Tweet> {
        return self.client.get("/statuses/retweets_of_me.json", params: Dictionary.createWithNotNil(
            "count"                .by(count),
            "since_id"             .by(sinceId),
            "max_id"               .by(maxId),
            "trim_user"            .by(trimUser),
            "include_entities"     .by(includeEntities),
            "include_user_entities".by(includeUserEntities)
        )).decode().flatMapSequence()
    }
}

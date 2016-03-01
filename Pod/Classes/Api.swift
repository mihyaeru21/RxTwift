//
//  Api.swift
//  Pods
//
//  Created by Mihyaeru on 2/28/16.
//
//

import Foundation
import RxSwift

public class Api {
    let client: Client

    public lazy var statuses: StatusesApi = StatusesApi(client: self.client)

    public init(
            consumerKey:       String,
            consumerSecret:    String,
            accessToken:       String,
            accessTokenSecret: String,
            random:            RandomProtocol    = Random(),
            timestamp:         TimestampProtocol = Timestamp()
    ) {
        let oauth = OAuth(
            consumerKey:       consumerKey,
            consumerSecret:    consumerSecret,
            accessToken:       accessToken,
            accessTokenSecret: accessTokenSecret,
            random:            random,
            timestamp:         timestamp
        )
        self.client = Client(oauth: oauth)
    }
}

public class StatusesApi {
    private let client: Client
    private init(client: Client) {
        self.client = client
    }

    public func getHomeTimeline(
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

    public func getMentionsTimeline(
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

    public func getUserTimeline(
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

    public func getRetweetsOfMe(
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

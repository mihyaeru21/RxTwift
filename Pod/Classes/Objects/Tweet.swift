//
//  Tweet.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/tweets
public class Tweet {
//    let annotations: String  // unused
    public let contributors: [Contributor]?
    public let coordinates: Coordinate?
    public let createdAt: String
    public let currentUserRetweetId: Int64?
    public let entities: TweetEntities?
    public let favoriteCount: Int?
    public let favorited: Bool?
    public let filterLevel: String?
//    let geo: String?  // deprecated Geo
    public let id: Int64
    public let inReplyToScreenName: String?
    public let inReplyToStatusId: Int64?
    public let inReplyToUserId: Int64?
    public let lang: String?
    public let place: Place?
    public let possiblySensitive: Bool?
    public let quotedStatusId: Int64?
    public let quotedStatus: Tweet?
    public let scopes: [String: String]?  // undocumented key value
    public let retweetCount: Int
    public let retweeted: Bool?
    public let retweetedStatus: Tweet?
    public let source: String
    public let text: String
    public let truncated: Bool
    public let user: User
    public let withheldCopyright: Bool?
    public let withheldInCountries: [String]?
    public let withheldScope: String?

    init(
        contributors: [Contributor]?,
        coordinates: Coordinate?,
        createdAt: String,
        currentUserRetweetId: Int64?,
        entities: TweetEntities?,
        favoriteCount: Int?,
        favorited: Bool?,
        filterLevel: String?,
//        geo: String?,
        id: Int64,
        inReplyToScreenName: String?,
        inReplyToStatusId: Int64?,
        inReplyToUserId: Int64?,
        lang: String?,
        place: Place?,
        possiblySensitive: Bool?,
        quotedStatusId: Int64?,
        quotedStatus: Tweet?,
        scopes: [String: String]?,
        retweetCount: Int,
        retweeted: Bool?,
        retweetedStatus: Tweet?,
        source: String,
        text: String,
        truncated: Bool,
        user: User,
        withheldCopyright: Bool?,
        withheldInCountries: [String]?,
        withheldScope: String?
    ) {
        self.contributors         = contributors
        self.coordinates          = coordinates
        self.createdAt            = createdAt
        self.currentUserRetweetId = currentUserRetweetId
        self.entities             = entities
        self.favoriteCount        = favoriteCount
        self.favorited            = favorited
        self.filterLevel          = filterLevel
//        self.geo                  = geo
        self.id                   = id
        self.inReplyToScreenName  = inReplyToScreenName
        self.inReplyToStatusId    = inReplyToStatusId
        self.inReplyToUserId      = inReplyToUserId
        self.lang                 = lang
        self.place                = place
        self.possiblySensitive    = possiblySensitive
        self.quotedStatusId       = quotedStatusId
        self.quotedStatus         = quotedStatus
        self.scopes               = scopes
        self.retweetCount         = retweetCount
        self.retweeted            = retweeted
        self.retweetedStatus      = retweetedStatus
        self.source               = source
        self.text                 = text
        self.truncated            = truncated
        self.user                 = user
        self.withheldCopyright    = withheldCopyright
        self.withheldInCountries  = withheldInCountries
        self.withheldScope        = withheldScope
    }
}

extension Tweet : Decodable {
    public static func decode(json: JSON) -> Decoded<Tweet> {
        let a = curry(Tweet.init)
            <^> json <||? "contributors"
            <*> json <|?  "coordinates"
            <*> json <|   "created_at"
            <*> json <|?  ["current_user_retweet", "id"]
        let b = a <*> json <|?  "entities"
            <*> json <|?  "favorite_count"
            <*> json <|?  "favorited"
            <*> json <|?  "filter_level"
            <*> json <|   "id"
        let c = b <*> json <|?  "in_reply_to_screen_name"
            <*> json <|?  "in_reply_to_status_id"
            <*> json <|?  "in_reply_to_user_id"
            <*> json <|?  "lang"
            <*> json <|?  "place"
        let d = c <*> json <|?  "possibly_sensitive"
            <*> json <|?  "quoted_status_id"
            <*> json <|?  "quoted_status"
            <*> json <|||? "scopes"
            <*> json <|   "retweet_count"
            <*> json <|?  "retweeted"
            <*> json <|?  "retweeted_status"
        return d <*> json <|   "source"
            <*> json <|   "text"
            <*> json <|   "truncated"
            <*> json <|   "user"
            <*> json <|?  "withheld_copyright"
            <*> json <||? "withheld_in_countries"
            <*> json <|?  "withheld_scope"
    }
}

//
//  RxTwiftTweet.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/tweets
public class RxTwiftTweet {
//    let annotations: String  // unused
    public let contributors: [RxTwiftContributor]?
    public let coordinates: RxTwiftCoordinate?
    public let createdAt: String
    public let currentUserRetweet: RxTwiftId?
    public let entities: RxTwiftTweetEntities
    public let favoriteCount: Int?
    public let favorited: Bool?
    public let filterLevel: String?
//    let geo: String?  // deprecated Geo
    public let id: Int64
    public let idStr: String
    public let inReplyToScreenName: String?
    public let inReplyToStatusId: Int64?
    public let inReplyToStatusIdStr: String?
    public let inReplyToUserId: Int64?
    public let inReplyToUserIdStr: String?
    public let lang: String?
    public let place: RxTwiftPlace?
    public let possiblySensitive: Bool?
    public let quotedStatusId: Int64?
    public let quotedStatusIdStr: String?
    public let quotedStatus: RxTwiftTweet?
    public let scopes: [String: String]?  // undocumented key value
    public let retweetCount: Int
    public let retweeted: Bool?
    public let retweetedStatus: RxTwiftTweet?
    public let source: String
    public let text: String
    public let truncated: Bool
    public let user: RxTwiftUser
    public let withheldCopyright: Bool?
    public let withheldInCountries: [String]?
    public let withheldScope: String?

    init(
        contributors: [RxTwiftContributor]?,
        coordinates: RxTwiftCoordinate?,
        createdAt: String,
        currentUserRetweet: RxTwiftId?,
        entities: RxTwiftTweetEntities,
        favoriteCount: Int?,
        favorited: Bool?,
        filterLevel: String?,
//        geo: String?,
        id: Int64,
        idStr: String,
        inReplyToScreenName: String?,
        inReplyToStatusId: Int64?,
        inReplyToStatusIdStr: String?,
        inReplyToUserId: Int64?,
        inReplyToUserIdStr: String?,
        lang: String?,
        place: RxTwiftPlace?,
        possiblySensitive: Bool?,
        quotedStatusId: Int64?,
        quotedStatusIdStr: String?,
        quotedStatus: RxTwiftTweet?,
        scopes: [String: String]?,
        retweetCount: Int,
        retweeted: Bool?,
        retweetedStatus: RxTwiftTweet?,
        source: String,
        text: String,
        truncated: Bool,
        user: RxTwiftUser,
        withheldCopyright: Bool?,
        withheldInCountries: [String]?,
        withheldScope: String?
    ) {
        self.contributors         = contributors
        self.coordinates          = coordinates
        self.createdAt            = createdAt
        self.currentUserRetweet   = currentUserRetweet
        self.entities             = entities
        self.favoriteCount        = favoriteCount
        self.favorited            = favorited
        self.filterLevel          = filterLevel
//        self.geo                  = geo
        self.id                   = id
        self.idStr                = idStr
        self.inReplyToScreenName  = inReplyToScreenName
        self.inReplyToStatusId    = inReplyToStatusId
        self.inReplyToStatusIdStr = inReplyToStatusIdStr
        self.inReplyToUserId      = inReplyToUserId
        self.inReplyToUserIdStr   = inReplyToUserIdStr
        self.lang                 = lang
        self.place                = place
        self.possiblySensitive    = possiblySensitive
        self.quotedStatusId       = quotedStatusId
        self.quotedStatusIdStr    = quotedStatusIdStr
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

extension RxTwiftTweet : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftTweet> {
        let a = curry(RxTwiftTweet.init)
            <^> json <||? "contributors"
            <*> json <|?  "coordinates"
            <*> json <|   "created_at"
            <*> json <|?  "current_user_retweet"
        let b = a <*> json <|   "entities"
            <*> json <|?  "favorite_count"
            <*> json <|?  "favorited"
            <*> json <|?  "filter_level"
            <*> json <|   "id"
            <*> json <|   "id_str"
        let c = b <*> json <|?  "in_reply_to_screen_name"
            <*> json <|?  "in_reply_to_status_id"
            <*> json <|?  "in_reply_to_status_id_str"
            <*> json <|?  "in_reply_to_user_id"
            <*> json <|?  "in_reply_to_user_id_str"
            <*> json <|?  "lang"
            <*> json <|?  "place"
        let d = c <*> json <|?  "possibly_sensitive"
            <*> json <|?  "quoted_status_id"
            <*> json <|?  "quoted_status_id_str"
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

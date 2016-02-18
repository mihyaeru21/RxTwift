//
//  RxTwiftTweet.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/tweets
public class RxTwiftTweet {
//    let annotations: String  // unused
    let contributors: [RxTwiftContributor]?
    let coordinates: RxTwiftCoordinate?
    let createdAt: String
    let currentUserRetweet: RxTwiftid?
    let entities: RxTwiftTweetEntities
    let favoriteCount: Int?
    let favorited: Bool?
    let filterLevel: String
//    let geo: String?  // deprecated Geo
    let id: Int64
    let idStr: String
    let inReplyToScreenName: String?
    let inReplyToStatusId: Int64?
    let inReplyToStatusIdStr: String?
    let inReplyToUserId: Int64?
    let inReplyToUserIdStr: String?
    let lang: String?
    let place: RxTwiftPlace?
    let possiblySensitive: Bool?
    let quotedStatusId: Int64?
    let quotedStatusIdStr: String?
    let quotedStatus: RxTwiftTweet?
    let scopes: [String: String]  // undocumented key value
    let retweetCount: Int
    let retweeted: Bool?
    let retweetedStatus: RxTwiftTweet?
    let source: String
    let text: String
    let truncated: Bool
    let user: RxTwiftUser
    let withheldCopyright: Bool
    let withheldInCountries: [String]
    let withheldScope: String

    init(
        contributors: [RxTwiftContributor]?,
        coordinates: RxTwiftCoordinate?,
        createdAt: String,
        currentUserRetweet: RxTwiftid?,
        entities: RxTwiftTweetEntities,
        favoriteCount: Int?,
        favorited: Bool?,
        filterLevel: String,
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
        scopes: [String: String],
        retweetCount: Int,
        retweeted: Bool?,
        retweetedStatus: RxTwiftTweet?,
        source: String,
        text: String,
        truncated: Bool,
        user: RxTwiftUser,
        withheldCopyright: Bool,
        withheldInCountries: [String],
        withheldScope: String
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

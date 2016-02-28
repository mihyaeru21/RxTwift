//
//  RxTwiftTweetEntities.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities
public class RxTwiftTweetEntities {
    public let hashtags: [RxTwiftHashtag]
    public let media: [RxTwiftMedium]?
    public let symbols: [RxTwiftSymbol]
    public let urls: [RxTwiftUrl]
    public let userMentions: [RxTwiftUserMention]

    public init(
        hashtags: [RxTwiftHashtag],
        media: [RxTwiftMedium]?,
        symbols: [RxTwiftSymbol],
        urls: [RxTwiftUrl],
        userMentions: [RxTwiftUserMention]
    ) {
        self.hashtags     = hashtags
        self.media        = media
        self.symbols      = symbols
        self.urls         = urls
        self.userMentions = userMentions
    }
}

extension RxTwiftTweetEntities : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftTweetEntities> {
        return curry(RxTwiftTweetEntities.init)
            <^> json <||  "hashtags"
            <*> json <||? "media"
            <*> json <||  "symbols"
            <*> json <||  "urls"
            <*> json <||  "user_mentions"
    }
}

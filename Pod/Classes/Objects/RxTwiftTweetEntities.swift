//
//  RxTwiftTweetEntities.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/entities
public class RxTwiftTweetEntities {
    let hashtags: [RxTwiftHashtag]
    let media: [RxTwiftMedium]
    let symbols: [RxTwiftSymbol]
    let urls: [RxTwiftUrl]
    let userMentions: [RxTwiftUserMention]

    public init(
        hashtags: [RxTwiftHashtag],
        media: [RxTwiftMedium],
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

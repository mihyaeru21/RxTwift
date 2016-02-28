//
//  TweetEntities.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities
public struct TweetEntities {
    public let hashtags: [Hashtag]
    public let media: [Medium]?
    public let symbols: [Symbol]
    public let urls: [Url]
    public let userMentions: [UserMention]
}

extension TweetEntities : Decodable {
    public static func decode(json: JSON) -> Decoded<TweetEntities> {
        return curry(TweetEntities.init)
            <^> json <||  "hashtags"
            <*> json <||? "media"
            <*> json <||  "symbols"
            <*> json <||  "urls"
            <*> json <||  "user_mentions"
    }
}

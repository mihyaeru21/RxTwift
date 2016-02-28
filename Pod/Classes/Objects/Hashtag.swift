//
//  Hashtag.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-hashtags
public struct Hashtag {
    public let indices: [Int]
    public let text: String
}

extension Hashtag : Decodable {
    public static func decode(json: JSON) -> Decoded<Hashtag> {
        return curry(Hashtag.init)
            <^> json <|| "indices"
            <*> json <|  "text"
    }
}

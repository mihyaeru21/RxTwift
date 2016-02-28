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
public class Hashtag {
    public let indices: [Int]
    public let text: String

    public init(
        indices: [Int],
        text: String
    ) {
        self.indices = indices
        self.text = text
    }
}

extension Hashtag : Decodable {
    public static func decode(json: JSON) -> Decoded<Hashtag> {
        return curry(Hashtag.init)
            <^> json <|| "indices"
            <*> json <|  "text"
    }
}

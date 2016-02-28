//
//  RxTwiftHashtag.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-hashtags
public class RxTwiftHashtag {
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

extension RxTwiftHashtag : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftHashtag> {
        return curry(RxTwiftHashtag.init)
            <^> json <|| "indices"
            <*> json <|  "text"
    }
}

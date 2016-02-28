//
//  RxTwiftSymbol.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities-in-twitter-objects#symbols
public class RxTwiftSymbol {
    public let text: String
    public let indices: [Int]

    public init(
        text: String,
        indices: [Int]
    ) {
        self.text    = text
        self.indices = indices
    }
}

extension RxTwiftSymbol : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftSymbol> {
        return curry(RxTwiftSymbol.init)
            <^> json <|  "text"
            <*> json <|| "indices"
    }
}

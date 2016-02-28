//
//  Symbol.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities-in-twitter-objects#symbols
public struct Symbol {
    public let text: String
    public let indices: [Int]
}

extension Symbol : Decodable {
    public static func decode(json: JSON) -> Decoded<Symbol> {
        return curry(Symbol.init)
            <^> json <|  "text"
            <*> json <|| "indices"
    }
}

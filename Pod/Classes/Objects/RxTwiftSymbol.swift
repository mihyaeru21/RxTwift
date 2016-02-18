//
//  RxTwiftSymbol.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/entities-in-twitter-objects#symbols
public class RxTwiftSymbol {
    let text: String
    let indices: [Int]

    public init(
        text: String,
        indices: [Int]
    ) {
        self.text    = text
        self.indices = indices
    }
}

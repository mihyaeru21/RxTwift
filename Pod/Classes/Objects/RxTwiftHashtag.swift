//
//  RxTwiftHashtag.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/entities#obj-hashtags
public class RxTwiftHashtag {
    let indices: [Int]
    let text: String

    public init(
        indices: [Int],
        text: String
    ) {
        self.indices = indices
        self.text = text
    }
}

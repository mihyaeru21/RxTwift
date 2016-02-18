//
//  RxTwiftUrl.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/entities#obj-url
public class RxTwiftUrl {
    let displayUrl: String
    let expandedUrl: String
    let indices: [Int]
    let url: String

    public init(
        displayUrl: String,
        expandedUrl: String,
        indices: [Int],
        url: String
    ) {
        self.displayUrl  = displayUrl
        self.expandedUrl = expandedUrl
        self.indices     = indices
        self.url         = url
    }
}

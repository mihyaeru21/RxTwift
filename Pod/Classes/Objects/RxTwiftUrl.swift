//
//  RxTwiftUrl.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-url
public class RxTwiftUrl {
    public let displayUrl: String
    public let expandedUrl: String
    public let indices: [Int]
    public let url: String

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

extension RxTwiftUrl : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftUrl> {
        return curry(RxTwiftUrl.init)
            <^> json <|  "display_url"
            <*> json <|  "expanded_url"
            <*> json <|| "indices"
            <*> json <|  "url"
    }
}

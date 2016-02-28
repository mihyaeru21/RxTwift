//
//  Url.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-url
public struct Url {
    public let displayUrl: String
    public let expandedUrl: String
    public let indices: [Int]
    public let url: String
}

extension Url : Decodable {
    public static func decode(json: JSON) -> Decoded<Url> {
        return curry(Url.init)
            <^> json <|  "display_url"
            <*> json <|  "expanded_url"
            <*> json <|| "indices"
            <*> json <|  "url"
    }
}

//
//  Medium.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-media
public struct Medium {
    public let displayUrl:     String
    public let expandedUrl:    String
    public let id:             Int64
    public let indices:        [Int]
    public let mediaUrlHttps:  String
    public let sizes:          [String: Size]
    public let sourceStatusId: Int64
    public let type:           String
    public let url:            String
}

extension Medium : Decodable {
    public static func decode(json: JSON) -> Decoded<Medium> {
        let a = curry(Medium.init)
            <^> json <|   "display_url"
            <*> json <|   "expanded_url"
            <*> json <|   "id"
            <*> json <||  "indices"
        return a <*> json <|   "media_url_https"
            <*> json <||| "sizes"
            <*> json <|   "source_status_id"
            <*> json <|   "type"
            <*> json <|   "url"
    }
}

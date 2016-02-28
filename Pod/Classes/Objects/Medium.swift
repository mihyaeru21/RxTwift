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
public class Medium {
    public let displayUrl:        String
    public let expandedUrl:       String
    public let id:                Int64
    public let idStr:             String
    public let indices:           [Int]
    public let mediaUrl:          String
    public let mediaUrlHttps:     String
    public let sizes:             [String: Size]
    public let sourceStatusId:    Int64
    public let sourceStatusIdStr: String
    public let type:              String
    public let url:               String

    public init(
        displayUrl:        String,
        expandedUrl:       String,
        id:                Int64,
        idStr:             String,
        indices:           [Int],
        mediaUrl:          String,
        mediaUrlHttps:     String,
        sizes:             [String: Size],
        sourceStatusId:    Int64,
        sourceStatusIdStr: String,
        type:              String,
        url:               String
    ) {
        self.displayUrl        = displayUrl
        self.expandedUrl       = expandedUrl
        self.id                = id
        self.idStr             = idStr
        self.indices           = indices
        self.mediaUrl          = mediaUrl
        self.mediaUrlHttps     = mediaUrlHttps
        self.sizes             = sizes
        self.sourceStatusId    = sourceStatusId
        self.sourceStatusIdStr = sourceStatusIdStr
        self.type              = type
        self.url               = url
    }
}

extension Medium : Decodable {
    public static func decode(json: JSON) -> Decoded<Medium> {
        let a = curry(Medium.init)
            <^> json <|   "display_url"
            <*> json <|   "expanded_url"
            <*> json <|   "id"
            <*> json <|   "id_str"
            <*> json <||  "indices"
            <*> json <|   "media_url"
        return a <*> json <|   "media_url_https"
            <*> json <||| "sizes"
            <*> json <|   "source_status_id"
            <*> json <|   "source_status_id_str"
            <*> json <|   "type"
            <*> json <|   "url"
    }
}

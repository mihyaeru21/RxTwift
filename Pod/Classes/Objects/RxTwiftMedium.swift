//
//  RxTwiftMedium.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/entities#obj-media
public class RxTwiftMedium {
    let displayUrl: String
    let expandedUrl: String
    let id: Int64
    let idStr: String
    let indices: [Int]
    let mediaUrl: String
    let mediaUrlHttps: String
    let sizes: [String: RxTwiftSize]
    let sourceStatusId: Int64
    let sourceStatusIdStr: String
    let type: String
    let url: String

    public init(
        displayUrl: String,
        expandedUrl: String,
        id: Int64,
        idStr: String,
        indices: [Int],
        mediaUrl: String,
        mediaUrlHttps: String,
        sizes: [String: RxTwiftSize],
        sourceStatusId: Int64,
        sourceStatusIdStr: String,
        type: String,
        url: String
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

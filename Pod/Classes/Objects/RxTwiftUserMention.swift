//
//  RxTwiftUserMention.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/entities#obj-usermention
public class RxTwiftUserMention {
    let id: Int64
    let idStr: String
    let indices: [Int]
    let name: String
    let screenName: String

    public init(
        id: Int64,
        idStr: String,
        indices: [Int],
        name: String,
        screenName: String
    ) {
        self.id         = id
        self.idStr      = idStr
        self.indices    = indices
        self.name       = name
        self.screenName = screenName
    }
}

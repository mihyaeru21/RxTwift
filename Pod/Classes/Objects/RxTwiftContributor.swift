//
//  RxTwiftContributor.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/tweets#obj-contributors
public class RxTwiftContributor {
    let id: Int64
    let idStr: String
    let screenName: String

    public init(
        id: Int64,
        idStr: String,
        screenName: String
    ) {
        self.id         = id
        self.idStr      = idStr
        self.screenName = screenName
    }
}

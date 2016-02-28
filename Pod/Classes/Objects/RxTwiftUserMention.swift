//
//  RxTwiftUserMention.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-usermention
public class RxTwiftUserMention {
    public let id:         Int64
    public let idStr:      String
    public let indices:    [Int]
    public let name:       String
    public let screenName: String

    public init(
        id:         Int64,
        idStr:      String,
        indices:    [Int],
        name:       String,
        screenName: String
    ) {
        self.id         = id
        self.idStr      = idStr
        self.indices    = indices
        self.name       = name
        self.screenName = screenName
    }
}

extension RxTwiftUserMention : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftUserMention> {
        return curry(RxTwiftUserMention.init)
            <^> json <|  "id"
            <*> json <|  "id_str"
            <*> json <|| "indices"
            <*> json <|  "name"
            <*> json <|  "screen_name"
    }
}

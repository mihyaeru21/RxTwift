//
//  UserMention.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/entities#obj-usermention
public struct UserMention {
    public let id:         Int64
    public let indices:    [Int]
    public let name:       String
    public let screenName: String
}

extension UserMention : Decodable {
    public static func decode(json: JSON) -> Decoded<UserMention> {
        return curry(UserMention.init)
            <^> json <|  "id"
            <*> json <|| "indices"
            <*> json <|  "name"
            <*> json <|  "screen_name"
    }
}

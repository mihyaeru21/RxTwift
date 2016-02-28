//
//  Contributor.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/tweets#obj-contributors
public class Contributor {
    public let id:         Int64
    public let idStr:      String
    public let screenName: String

    public init(
        id:         Int64,
        idStr:      String,
        screenName: String
    ) {
        self.id         = id
        self.idStr      = idStr
        self.screenName = screenName
    }
}

extension Contributor : Decodable {
    public static func decode(json: JSON) -> Decoded<Contributor> {
        return curry(Contributor.init)
            <^> json <| "id"
            <*> json <| "id_str"
            <*> json <| "screen_name"
    }
}

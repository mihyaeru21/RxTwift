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
public struct Contributor {
    public let id:         Int64
    public let screenName: String
}

extension Contributor : Decodable {
    public static func decode(json: JSON) -> Decoded<Contributor> {
        return curry(Contributor.init)
            <^> json <| "id"
            <*> json <| "screen_name"
    }
}

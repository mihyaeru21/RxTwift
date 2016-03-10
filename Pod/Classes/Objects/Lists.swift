//
//  Lists.swift
//  Pods
//
//  Created by Mihyaeru on 3/9/16.
//
//

import Foundation
import Argo
import Curry

public struct Lists {
    public let previousCursor: Int64
    public let nextCursor:     Int64
    public let lists:          [List]
}

extension Lists: Decodable {
    public static func decode(json: JSON) -> Decoded<Lists> {
        return curry(Lists.init)
            <^> json <|  "previous_cursor"
            <*> json <|  "next_cursor"
            <*> json <|| "lists"
    }
}

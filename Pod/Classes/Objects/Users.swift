//
//  Users.swift
//  Pods
//
//  Created by Mihyaeru on 3/9/16.
//
//

import Foundation
import Argo
import Curry

public struct Users {
    public let previousCursor:    Int64
    public let previousCursorStr: String
    public let nextCursor:        Int64
    public let nextCursorStr:     String
    public let users:             [User]
}

extension Users: Decodable {
    public static func decode(json: JSON) -> Decoded<Users> {
        return curry(Users.init)
            <^> json <|  "previous_cursor"
            <*> json <|  "previous_cursor_str"
            <*> json <|  "next_cursor"
            <*> json <|  "next_cursor_str"
            <*> json <|| "users"
    }
}

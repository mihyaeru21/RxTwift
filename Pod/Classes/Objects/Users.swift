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
    public let previousCursor: Int64
    public let nextCursor:     Int64
    public let users:          [User]
}

extension Users: Decodable {
    public static func decode(json: JSON) -> Decoded<Users> {
        return curry(Users.init)
            <^> json <|  "previous_cursor"
            <*> json <|  "next_cursor"
            <*> json <|| "users"
    }
}

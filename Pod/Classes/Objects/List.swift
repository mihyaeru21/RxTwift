//
//  List.swift
//  Pods
//
//  Created by Mihyaeru on 3/8/16.
//
//

import Foundation
import Argo
import Curry

public struct List {
    public let createdAt: String
    public let description: String
    public let following: Bool
    public let fullName: String
    public let id: Int64
    public let idStr: String
    public let memberCount: Int
    public let mode: String
    public let name: String
    public let slug: String
    public let subscriberCount: Int
    public let uri: String
    public let user: User
}

extension List : Decodable {
    public static func decode(json: JSON) -> Decoded<List> {
        let a = curry(List.init)
            <^> json <| "created_at"
            <*> json <| "description"
            <*> json <| "following"
            <*> json <| "full_name"
            <*> json <| "id"
            <*> json <| "id_str"
        return a <*> json <| "member_count"
            <*> json <| "mode"
            <*> json <| "name"
            <*> json <| "slug"
            <*> json <| "subscriber_count"
            <*> json <| "uri"
            <*> json <| "user"
    }
}

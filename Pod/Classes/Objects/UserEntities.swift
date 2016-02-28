//
//  UserEntities.swift
//  Pods
//
//  Created by Mihyaeru on 2/19/16.
//
//

import Foundation
import Argo
import Curry

public struct UserEntities {
    public struct Urls : Decodable {
        public let urls: [Url]

        public static func decode(json: JSON) -> Decoded<Urls> {
            return curry(Urls.init)
                <^> json <|| "urls"
        }
    }

    public let description: Urls
    public let url: Urls?
}

extension UserEntities : Decodable {
    public static func decode(json: JSON) -> Decoded<UserEntities> {
        return curry(UserEntities.init)
            <^> json <|  "description"
            <*> json <|? "url"
    }
}

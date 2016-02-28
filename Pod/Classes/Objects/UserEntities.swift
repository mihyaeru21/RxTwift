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

public class UserEntities {
    public class Urls : Decodable {
        public let urls: [Url]
        public init(urls: [Url]) {
            self.urls = urls
        }

        public static func decode(json: JSON) -> Decoded<Urls> {
            return curry(Urls.init)
                <^> json <|| "urls"
        }
    }

    public let description: Urls
    public let url: Urls?

    public init(
        description: Urls,
        url: Urls?
    ) {
        self.description = description
        self.url = url
    }
}

extension UserEntities : Decodable {
    public static func decode(json: JSON) -> Decoded<UserEntities> {
        return curry(UserEntities.init)
            <^> json <|  "description"
            <*> json <|? "url"
    }
}

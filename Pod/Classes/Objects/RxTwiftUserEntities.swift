//
//  RxTwiftUserEntities.swift
//  Pods
//
//  Created by Mihyaeru on 2/19/16.
//
//

import Foundation
import Argo
import Curry

public class RxTwiftUserEntities {
    public class Urls : Decodable {
        public let urls: [RxTwiftUrl]
        public init(urls: [RxTwiftUrl]) {
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

extension RxTwiftUserEntities : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftUserEntities> {
        return curry(RxTwiftUserEntities.init)
            <^> json <|  "description"
            <*> json <|? "url"
    }
}

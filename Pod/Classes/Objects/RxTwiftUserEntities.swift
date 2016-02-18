//
//  RxTwiftUserEntities.swift
//  Pods
//
//  Created by Mihyaeru on 2/19/16.
//
//

import Foundation

public class RxTwiftUserEntities {
    public class Urls {
        let urls: [RxTwiftUrl]
        public init(urls: [RxTwiftUrl]) {
            self.urls = urls
        }
    }

    let description: Urls
    let url: Urls

    public init(
        description: Urls,
        url: Urls
    ) {
        self.description = description
        self.url = url
    }
}

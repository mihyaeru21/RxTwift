//
//  GetListsApi.swift
//  Pods
//
//  Created by Mihyaeru on 3/9/16.
//
//

import Foundation
import RxSwift

public class GetListsApi {
    internal let client: Client
    internal init(client: Client) {
        self.client = client
    }

    // https://dev.twitter.com/rest/reference/get/lists/list
    public func list(
        userId userId: Int64?  = nil,
        screenName:    String? = nil,
        reverse:       Bool?   = nil
    ) -> Observable<List> {
        return self.client.get("/lists/list.json", params: Dictionary.createWithNotNil(
            "user_id"    .by(userId),
            "screen_name".by(screenName),
            "reverse"    .by(reverse)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/lists/show
    public func show(
        listId listId:   Int64?  = nil,
        slug:            String? = nil,
        ownerScreenName: String? = nil,
        ownerId:         Int64?  = nil
    ) -> Observable<List> {
        return self.client.get("/lists/show.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_screen_name".by(ownerScreenName),
            "owner_id"         .by(ownerId)
        )).decode()
    }
}

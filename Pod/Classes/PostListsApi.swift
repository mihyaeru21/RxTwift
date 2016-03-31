//
//  PostListsApi.swift
//  Pods
//
//  Created by Mihyaeru on 3/31/16.
//
//

import Foundation
import RxSwift

public class PostListsApi {
    internal let client: Client
    internal init(client: Client) {
        self.client = client
    }

    // https://dev.twitter.com/rest/reference/post/lists/create
    public func create(
            name name:   String,
            mode:        String? = nil,
            description: String? = nil
    ) -> Observable<List> {
        return self.client.post("/lists/create.json", params: Dictionary.createWithNotNil(
            "name"       .by(name),
            "mode"       .by(mode),
            "description".by(description)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/post/lists/update
    public func update(
            listId listId:   Int64?  = nil,
            slug:            String? = nil,
            ownerId:         Int64?  = nil,
            ownerScreenName: String? = nil,
            name:            String? = nil,
            mode:            String? = nil,
            description:     String? = nil
    ) -> Observable<List> {
        return self.client.post("/lists/update.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_id"         .by(ownerId),
            "owner_screen_name".by(ownerScreenName),
            "name"             .by(name),
            "mode"             .by(mode),
            "description"      .by(description)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/post/lists/destroy
    public func destroy(
            listId listId:   Int64?  = nil,
            slug:            String? = nil,
            ownerId:         Int64?  = nil,
            ownerScreenName: String? = nil
    ) -> Observable<List> {
        return self.client.post("/lists/destroy.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_id"         .by(ownerId),
            "owner_screen_name".by(ownerScreenName)
        )).decode()
    }
}

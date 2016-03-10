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

    // https://dev.twitter.com/rest/reference/get/lists/statuses
    public func statuses(
        listId listId:   Int64?  = nil,
        slug:            String? = nil,
        ownerScreenName: String? = nil,
        ownerId:         Int64?  = nil,
        sinceId:         Int64?  = nil,
        maxId:           Int64?  = nil,
        count:           Int?    = nil,
        includeEntities: Bool?   = nil,
        includeRts:      Bool?   = nil
    ) -> Observable<Tweet> {
        return self.client.get("/lists/statuses.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_screen_name".by(ownerScreenName),
            "owner_id"         .by(ownerId),
            "since_id"         .by(sinceId),
            "max_id"           .by(maxId),
            "count"            .by(count),
            "include_entities" .by(includeEntities),
            "include_rts"      .by(includeRts)
        )).decode().flatMapSequence()
    }

    // https://dev.twitter.com/rest/reference/get/lists/subscriptions
    public func subscriptions(
        userId userId: Int64?  = nil,
        screenName:    String? = nil,
        count:         Int?    = nil,
        cursor:        Int64?  = nil
    ) -> Observable<Lists> {
        return self.client.get("/lists/subscriptions.json", params: Dictionary.createWithNotNil(
            "user_id"    .by(userId),
            "screen_name".by(screenName),
            "count"      .by(count),
            "cursor"     .by(cursor)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/get/lists/ownerships
    public func ownerships(
        userId userId: Int64?  = nil,
        screenName:    String? = nil,
        count:         Int?    = nil,
        cursor:        Int64?  = nil
    ) -> Observable<Lists> {
        return self.client.get("/lists/ownerships.json", params: Dictionary.createWithNotNil(
            "user_id"    .by(userId),
            "screen_name".by(screenName),
            "count"      .by(count),
            "cursor"     .by(cursor)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/get/lists/memberships
    public func memberships(
        userId userId:      Int64?  = nil,
        screenName:         String? = nil,
        count:              Int?    = nil,
        cursor:             Int64?  = nil,
        filterToOwnedLists: Bool?   = nil
    ) -> Observable<Lists> {
        return self.client.get("/lists/memberships.json", params: Dictionary.createWithNotNil(
            "user_id"              .by(userId),
            "screen_name"          .by(screenName),
            "count"                .by(count),
            "cursor"               .by(cursor),
            "filter_to_owned_lists".by(cursor)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/get/lists/subscribers
    public func subscribers(
        listId listId:   Int64?  = nil,
        slug:            String? = nil,
        ownerScreenName: String? = nil,
        ownerId:         Int64?  = nil,
        count:           Int?    = nil,
        cursor:          Int64?  = nil,
        includeEntities: Bool?   = nil,
        skipStatus:      Bool?   = nil
    ) -> Observable<Users> {
        return self.client.get("/lists/subscribers.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_screen_name".by(ownerScreenName),
            "owner_id"         .by(ownerId),
            "count"            .by(count),
            "cursor"           .by(cursor),
            "include_entities" .by(includeEntities),
            "skip_status"      .by(skipStatus)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/get/lists/subscribers/show
    public func subscribersShow(
        listId listId:   Int64?  = nil,
        slug:            String? = nil,
        ownerScreenName: String? = nil,
        ownerId:         Int64?  = nil,
        userId:          Int64?  = nil,
        screenName:      String? = nil,
        includeEntities: Bool?   = nil,
        skipStatus:      Bool?   = nil
    ) -> Observable<User> {
        return self.client.get("/lists/subscribers/show.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_screen_name".by(ownerScreenName),
            "owner_id"         .by(ownerId),
            "user_id"          .by(userId),
            "screen_name"      .by(screenName),
            "include_entities" .by(includeEntities),
            "skip_status"      .by(skipStatus)
        )).decode()
    }

    // https://dev.twitter.com/rest/reference/get/lists/members
    public func members(
        listId listId:   Int64?  = nil,
        slug:            String? = nil,
        ownerScreenName: String? = nil,
        ownerId:         Int64?  = nil,
        count:           Int?    = nil,
        cursor:          Int64?  = nil,
        includeEntities: Bool?   = nil,
        skipStatus:      Bool?   = nil
    ) -> Observable<Users> {
        return self.client.get("/lists/members.json", params: Dictionary.createWithNotNil(
            "list_id"          .by(listId),
            "slug"             .by(slug),
            "owner_screen_name".by(ownerScreenName),
            "owner_id"         .by(ownerId),
            "count"            .by(count),
            "cursor"           .by(cursor),
            "include_entities" .by(includeEntities),
            "skip_status"      .by(skipStatus)
        )).decode()
    }
}

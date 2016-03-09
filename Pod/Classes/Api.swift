//
//  Api.swift
//  Pods
//
//  Created by Mihyaeru on 2/28/16.
//
//

import Foundation
import RxSwift

public class Api {
    private let client: Client

    public lazy var get: GetApi = GetApi(client: self.client)
    public lazy var post: PostApi = PostApi(client: self.client)

    public init(
            consumerKey:       String,
            consumerSecret:    String,
            accessToken:       String,
            accessTokenSecret: String,
            random:            RandomProtocol    = Random(),
            timestamp:         TimestampProtocol = Timestamp()
    ) {
        let oauth = OAuth(
            consumerKey:       consumerKey,
            consumerSecret:    consumerSecret,
            accessToken:       accessToken,
            accessTokenSecret: accessTokenSecret,
            random:            random,
            timestamp:         timestamp
        )
        self.client = Client(oauth: oauth)
    }
}

public class GetApi {
    internal let client: Client
    private init(client: Client) {
        self.client = client
    }

    public lazy var statuses: GetStatusesApi = GetStatusesApi(client: self.client)
    public lazy var lists:    GetListsApi    = GetListsApi(client: self.client)
}

public class PostApi {
    internal let client: Client
    private init(client: Client) {
        self.client = client
    }

    public lazy var statuses: PostStatusesApi = PostStatusesApi(client: self.client)
}

//
// Created by Mihyaeru on 西暦16/02/04.
//

import Foundation
import RxSwift

public class OAuth {
    public struct HeaderElement {
        public let key: String
        public let value: String
    }

    private let consumerKey: String
    private let consumerSecret: String
    private let accessToken: String
    private let accessTokenSecret: String
    private let random: RandomProtocol
    private let timestamp: TimestampProtocol

    public init(
            consumerKey: String,
            consumerSecret: String,
            accessToken: String,
            accessTokenSecret: String,
            random: RandomProtocol = Random(),
            timestamp: TimestampProtocol = Timestamp()
    ) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        self.accessToken = accessToken
        self.accessTokenSecret = accessTokenSecret
        self.random = random
        self.timestamp = timestamp
    }

    private lazy var key: String = "\(self.consumerSecret)&\(self.accessTokenSecret)"

    private lazy var oauthHeaderElements: [String: String] = [
        "oauth_consumer_key": self.consumerKey,
        "oauth_signature_method": "HMAC-SHA1",
        "oauth_version": "1.0",
        "oauth_token": self.accessToken,
    ]

    public func createAuthorizationHeaderElement(method: String, url: String, params: [String: String]) -> HeaderElement? {
        let headers = Dictionary.merge(dict: self.oauthHeaderElements, other: [
            "oauth_nonce": self.random.nonce,
            "oauth_timestamp": self.timestamp.current.description,
        ])

        guard let base = self.createBaseString(method, url: url, params: Dictionary.merge(dict: headers, other: params)) else { return nil }
        guard let signature = self.createSignature(base, key: self.key) else { return nil }

        let authHeaders = Dictionary.merge(dict: headers, other: ["oauth_signature": signature])
        let combinedHeader = authHeaders.map { key, value in "\(key)=\"\(value)\"" }.sort().joinWithSeparator(", ")
        return HeaderElement(key: "Authorization", value: "OAuth \(combinedHeader)")
    }

    private func createBaseString(method: String, url: String, params: [String: String]) -> String? {
        guard let
            encodedUrl = url.percentEncodedForOAuth,
            encodedParams = params.map({ key, value in "\(key)=\(value)" }).sort().joinWithSeparator("&").percentEncodedForOAuth
            else { return nil }
        return "\(method)&\(encodedUrl)&\(encodedParams)"
    }

    private func createSignature(base: String, key: String) -> String? {
        return Crypto.hmacSha1(key: key, message: base).percentEncodedForOAuth
    }
}

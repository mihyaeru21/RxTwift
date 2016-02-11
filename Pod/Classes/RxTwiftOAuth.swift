//
// Created by Mihyaeru on 西暦16/02/04.
//

import Foundation
import RxSwift

public class RxTwiftOAuth {
    private let consumerKey: String
    private let consumerSecret: String
    private let accessToken: String
    private let accessTokenSecret: String

    public init(
            consumerKey: String,
            consumerSecret: String,
            accessToken: String,
            accessTokenSecret: String
    ) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        self.accessToken = accessToken
        self.accessTokenSecret = accessTokenSecret
    }


    lazy var key: String = "\(self.consumerSecret)&\(self.accessTokenSecret)"

    public func createBaseString(method: String, url: String, params: [String: String]) -> String {
        guard let
            encodedUrl = url.percentEncodedString,
            encodedParams = params.map({ key, value in "\(key)=\(value)" }).sort().joinWithSeparator("&").percentEncodedString
            else { return "" }  // FIXME: exception
        return "\(method)&\(encodedUrl)&\(encodedParams)"
    }
}

// TODO: util
extension String {
    var percentEncodedString: String? {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())
    }
}

//
//  Client.swift
//  Pods
//
//  Created by Mihyaeru on 2/13/16.
//
//

import Foundation
import RxSwift

public class Client {
    enum Method: String {
        case Get = "GET"
        case Post = "POST"
    }

    private let oauth: OAuth

    public init(oauth: OAuth) {
        self.oauth = oauth
    }

    public func get(path: String, params: [String: String]) -> Observable<NSData> {
        return self.request(.Get, path: path, params: params)
    }

    public func post(path: String, params: [String: String]) -> Observable<NSData> {
        return self.request(.Post, path: path, params: params)
    }

    func request(method: Method, path: String, params: [String: String]) -> Observable<NSData> {
        return Observable.create { (observer: AnyObserver<NSData>) -> Disposable in
            let absUrl = "https://api.twitter.com/1.1" + path
            var encodedParams = Dictionary<String, String>()
            for (key, value) in params {
                if let key = key.percentEncodedForParams, value = value.percentEncodedForParams {
                    encodedParams[key] = value
                }
            }
            let auth = self.oauth.createAuthorizationHeaderElement(method.rawValue, url: absUrl, params: encodedParams)!

            var url = absUrl
            if method == .Get && encodedParams.count > 0 {
                url += "?" + encodedParams.map { "\($0)=\($1)" }.joinWithSeparator("&")
            }

            let request = NSMutableURLRequest(URL: NSURL(string: url)!)
            request.cachePolicy = .ReloadIgnoringLocalCacheData
            request.HTTPMethod = method.rawValue
            request.addValue(auth.value, forHTTPHeaderField: auth.key)
            if method == .Post {
                request.HTTPBody = encodedParams.map { "\($0)=\($1)" }.joinWithSeparator("&").dataUsingEncoding(NSUTF8StringEncoding)
                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            }

            let task = Request(request: request, observer: observer).start()
            return AnonymousDisposable { task.cancel() }
        }
    }
}

//
//  RxTwiftRequest.swift
//  Pods
//
//  Created by Mihyaeru on 2/13/16.
//
//

import Foundation
import RxSwift

public class RxTwiftRequest : NSObject, NSURLSessionDataDelegate {
    private let request: NSURLRequest
    private let observer: AnyObserver<String>
    private var data = NSMutableData()

    private lazy var session: NSURLSession = { [unowned self] in
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.timeoutIntervalForRequest = 5
        config.timeoutIntervalForResource = 10
        return NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
    }()

    init(request: NSURLRequest, observer: AnyObserver<String>) {
        self.request = request
        self.observer = observer
        super.init()
    }

    public func start() -> RxTwiftRequest {
        self.session.dataTaskWithRequest(self.request).resume()
        return self
    }

    public func cancel() {
        self.session.invalidateAndCancel()
    }

    public func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        completionHandler(.Allow)
    }

    public func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data)
    }

    public func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if let error = error {
            self.observer.onError(error)
        } else {
            if let string = NSString(data: self.data, encoding: NSUTF8StringEncoding) as? String {
                self.observer.onNext(string)
                self.observer.onCompleted()
            } else {
                self.observer.onError(NSError(domain: "FIXME", code: 0, userInfo: nil))
            }
        }
    }
}

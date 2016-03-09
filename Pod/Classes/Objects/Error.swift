//
//  Error.swift
//  Pods
//
//  Created by Mihyaeru on 3/6/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/response-codes
public struct Error {
    let code:    Int
    let message: String
}

extension Error: Decodable {
    public static func decode(json: JSON) -> Decoded<Error> {
        return curry(Error.init)
            <^> json <| "code"
            <*> json <| "message"
    }
}

extension Error: CustomStringConvertible {
    public var description: String {
        return "RxTwift.Error(code: \(self.code), message: \(self.message))"
    }
}

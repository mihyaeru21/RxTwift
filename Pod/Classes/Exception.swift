//
//  Exception.swift
//  Pods
//
//  Created by Mihyaeru on 3/6/16.
//
//

import Foundation
import Argo
import Curry

public struct Exception: ErrorType {
    let message:       String
    let errors:        [Error]
    let originalError: ErrorType?

    init(
        message:       String,
        errors:        [Error]    = [],
        originalError: ErrorType? = nil
    ) {
        self.message       = message
        self.errors        = errors
        self.originalError = originalError
    }
}

extension Exception: Decodable {
    private static func initForDecode(errors: [Error]) -> Exception {
        return Exception(message: "twitter error", errors: errors)
    }

    public static func decode(json: JSON) -> Decoded<Exception> {
        return curry(Exception.initForDecode)
            <^> json <|| "errors"
    }
}

extension Exception: CustomStringConvertible {
    public var description: String {
        return "RxTwift.Exception(message: \(self.message), errors: [\(self.errors.joinedString)], originalError: \(self.originalError))"
    }
}

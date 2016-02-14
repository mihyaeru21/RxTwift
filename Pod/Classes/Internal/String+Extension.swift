//
//  String+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

// http://oauth.net/core/1.0a/#encoding_parameters
private let allowedCharactersForOAuth: NSCharacterSet = {
    let set = NSMutableCharacterSet.alphanumericCharacterSet()
    set.addCharactersInString("-._~")
    return set
}()

private let allowedCharactersForParams: NSCharacterSet = {
    let set = NSMutableCharacterSet.alphanumericCharacterSet()
    set.addCharactersInString("-._")
    return set
}()

internal extension String {
    var percentEncodedForOAuth: String? {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharactersForOAuth)
    }

    var percentEncodedForParams: String? {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharactersForParams)
    }
}

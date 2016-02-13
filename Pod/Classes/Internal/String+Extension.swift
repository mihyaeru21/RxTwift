//
//  String+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

// http://oauth.net/core/1.0a/#encoding_parameters
private let allowedCharacters: NSCharacterSet = {
    let set = NSMutableCharacterSet.alphanumericCharacterSet()
    set.addCharactersInString("-._~")
    return set
}()

internal extension String {
    var percentEncodedString: String? {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacters)
    }
}

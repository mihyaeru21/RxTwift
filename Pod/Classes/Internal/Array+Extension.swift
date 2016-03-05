//
//  Array+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 3/5/16.
//
//

import Foundation

internal extension Array where Element: CustomStringConvertible {
    internal var joinedString: String {
        return self.map({ $0.description }).joinWithSeparator(",")
    }
}

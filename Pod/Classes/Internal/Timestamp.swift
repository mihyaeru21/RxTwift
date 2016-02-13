//
//  Timestamp.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

internal class Timestamp : RxTwiftTimestampProtocol {
    var current: Int {
        return Int(NSDate().timeIntervalSince1970)
    }
}

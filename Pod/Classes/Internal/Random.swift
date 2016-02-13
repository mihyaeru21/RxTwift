//
//  Random.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

internal class Random : RxTwiftRandomProtocol {
    var nonce: String {
        return NSUUID().UUIDString
    }
}

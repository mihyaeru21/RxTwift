//
//  Random.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

internal class Random : RandomProtocol {
    var nonce: String {
        return NSUUID().UUIDString
    }
}

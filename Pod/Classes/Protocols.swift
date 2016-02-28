//
//  File.swift
//  Pods
//
//  Created by Mihyaeru on 2/28/16.
//
//

import Foundation

public protocol RandomProtocol {
    var nonce: String { get }
}

public protocol TimestampProtocol {
    var current: Int { get }
}

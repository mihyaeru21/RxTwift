//
//  Dictionary+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

internal func merge<K, V>(dict dict: [K: V], other: [K: V]) -> [K: V] {
    var new = Dictionary<K, V>()
    for (key, value) in dict {
        new[key] = value
    }
    for (key, value) in other {
        new[key] = value
    }
    return new
}

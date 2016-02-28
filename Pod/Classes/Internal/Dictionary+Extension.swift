//
//  Dictionary+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 2/11/16.
//
//

import Foundation

internal extension Dictionary {
    internal static func merge(dict dict: [Key: Value], other: [Key: Value]) -> [Key: Value] {
        var new = Dictionary<Key, Value>()
        for (key, value) in dict {
            new[key] = value
        }
        for (key, value) in other {
            new[key] = value
        }
        return new
    }

    internal static func createWithNotNil(taples: (Key, Value?)...) -> Dictionary<Key, Value> {
        var dict = Dictionary<Key, Value>()
        for tuple in taples {
            if let value = tuple.1 {
                dict[tuple.0] = value
            }
        }
        return dict
    }
}

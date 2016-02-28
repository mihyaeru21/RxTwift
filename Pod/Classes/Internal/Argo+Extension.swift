//
//  Argo+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 2/27/16.
//
//

import Foundation
import Argo

infix operator <||| { associativity left precedence 150 }
infix operator <|||? { associativity left precedence 150 }

// Pull dictionary from JSON
public func <||| <A where A: Argo.Decodable, A == A.DecodedType>(json: JSON, key: String) -> Decoded<[String : A]> {
  return json <||| [key]
}

// Pull optional dictionary from JSON
public func <|||? <A where A: Argo.Decodable, A == A.DecodedType>(json: JSON, key: String) -> Decoded<[String : A]?> {
  return .optional(json <||| [key])
}

// Pull embedded dictionary from JSON
public func <||| <A where A: Argo.Decodable, A == A.DecodedType>(json: JSON, keys: [String]) -> Decoded<[String : A]> {
    return flatReduce(keys, initial: json, combine: decodedJSON) >>- Dictionary<String, A>.decode
}

// Pull embedded optional dictionary from JSON
public func <|||? <A where A: Argo.Decodable, A == A.DecodedType>(json: JSON, keys: [String]) -> Decoded<[String : A]?> {
  return .optional(json <||| keys)
}

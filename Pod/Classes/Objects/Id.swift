//
//  Id.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation
import Argo
import Curry

public struct Id {
    public let id: Int64
    public let idStr: String
}

extension Id : Decodable {
    public static func decode(json: JSON) -> Decoded<Id> {
        return curry(Id.init)
            <^> json <| "id"
            <*> json <| "id_str"
    }
}

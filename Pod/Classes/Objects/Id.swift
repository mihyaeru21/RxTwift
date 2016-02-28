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

public class Id {
    public let id: Int64
    public let idStr: String

    public init(
        id: Int64,
        idStr: String
    ) {
        self.id    = id
        self.idStr = idStr
    }
}

extension Id : Decodable {
    public static func decode(json: JSON) -> Decoded<Id> {
        return curry(Id.init)
            <^> json <| "id"
            <*> json <| "id_str"
    }
}

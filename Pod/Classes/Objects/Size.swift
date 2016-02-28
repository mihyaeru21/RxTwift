//
//  Size.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

public struct Size {
    public let h: Int
    public let resize: String
    public let w: Int
}

extension Size : Decodable {
    public static func decode(json: JSON) -> Decoded<Size> {
        return curry(Size.init)
            <^> json <| "h"
            <*> json <| "resize"
            <*> json <| "w"
    }
}

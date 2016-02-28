//
//  RxTwiftSize.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

public class RxTwiftSize {
    public let h: Int
    public let resize: String
    public let w: Int

    public init(
        h: Int,
        resize: String,
        w: Int
    ) {
        self.h = h
        self.resize = resize
        self.w = w
    }
}

extension RxTwiftSize : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftSize> {
        return curry(RxTwiftSize.init)
            <^> json <| "h"
            <*> json <| "resize"
            <*> json <| "w"
    }
}

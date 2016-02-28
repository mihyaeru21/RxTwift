//
//  RxTwiftCoordinate.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/tweets#obj-coordinates
public class RxTwiftCoordinate {
    public let coordinates: [Float]
    public let type:        String

    public init(
        coordinates: [Float],
        type:        String
    ) {
        self.coordinates = coordinates
        self.type        = type
    }
}

public extension RxTwiftCoordinate {
    public var lat: Float? { return self.coordinates.first }
    public var lng: Float? { return self.coordinates.last }
}

extension RxTwiftCoordinate : Decodable {
    public static func decode(json: JSON) -> Decoded<RxTwiftCoordinate> {
        return curry(RxTwiftCoordinate.init)
            <^> json <|| "coordinates"
            <*> json <|  "type"
    }
}

//
//  Coordinate.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/tweets#obj-coordinates
public class Coordinate {
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

public extension Coordinate {
    public var lat: Float? { return self.coordinates.first }
    public var lng: Float? { return self.coordinates.last }
}

extension Coordinate : Decodable {
    public static func decode(json: JSON) -> Decoded<Coordinate> {
        return curry(Coordinate.init)
            <^> json <|| "coordinates"
            <*> json <|  "type"
    }
}

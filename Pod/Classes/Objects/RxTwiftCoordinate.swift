//
//  RxTwiftCoordinate.swift
//  Pods
//
//  Created by Mihyaeru on 2/16/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/tweets#obj-coordinates
public class RxTwiftCoordinate {
    let coordinates: [Float]
    let type: String

    public init(
        coordinates: [Float],
        type: String
    ) {
        self.coordinates = coordinates
        self.type        = type
    }
}

public extension RxTwiftCoordinate {
    var lat: Float? { return self.coordinates.first }
    var lng: Float? { return self.coordinates.last }
}

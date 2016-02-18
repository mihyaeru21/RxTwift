//
//  RxTwiftPlace.swift
//  Pods
//
//  Created by Mihyaeru on 2/19/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/places
public class RxTwiftPlace {
    public class Box {
        let coordinates: [[[Float]]]
        let type: String

        public init(
            coordinates: [[[Float]]],
            type: String
        ) {
            self.coordinates = coordinates
            self.type        = type
        }
    }

    let attributes: [String: String] // to complex...
    let boundingBox: Box
    let country: String
    let countryCode: String
    let fullName: String
    let id: String
    let name: String
    let placeType: String
    let url: String

    public init(
        attributes: [String: String],
        boundingBox: Box,
        country: String,
        countryCode: String,
        fullName: String,
        id: String,
        name: String,
        placeType: String,
        url: String
    ) {
        self.attributes  = attributes
        self.boundingBox = boundingBox
        self.country     = country
        self.countryCode = countryCode
        self.fullName    = fullName
        self.id          = id
        self.name        = name
        self.placeType   = placeType
        self.url         = url
    }
}

//
//  Place.swift
//  Pods
//
//  Created by Mihyaeru on 2/19/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/places
public class Place {
    public class Box : Decodable {
        public let coordinates: [[[Float]]]
        public let type: String

        public init(
            coordinates: [[[Float]]],
            type: String
        ) {
            self.coordinates = coordinates
            self.type        = type
        }

        public static func decode(json: JSON) -> Decoded<Box> {
            return curry(Box.init)
                <^> pure([[[0]]])  // FIXME
                <*> json <| "type"
        }
    }

    public let attributes: [String: String] // to complex...
    public let boundingBox: Box
    public let country: String
    public let countryCode: String
    public let fullName: String
    public let id: String
    public let name: String
    public let placeType: String
    public let url: String

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

extension Place : Decodable {
    public static func decode(json: JSON) -> Decoded<Place> {
        let a = curry(Place.init)
            <^> json <||| "attributes"
            <*> json <|   "bounding_box"
            <*> json <|   "country"
            <*> json <|   "country_code"
            <*> json <|   "full_name"
            <*> json <|   "id"
        return a <*> json <|   "name"
            <*> json <|   "place_type"
            <*> json <|   "url"
    }
}

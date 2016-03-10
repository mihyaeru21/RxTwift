//
//  User.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation
import Argo
import Curry

// https://dev.twitter.com/overview/api/users
public struct User {
    public let contributorsEnabled:            Bool
    public let createdAt:                      String
    public let defaultProfile:                 Bool
    public let defaultProfileImage:            Bool
    public let description:                    String?
    public let entities:                       UserEntities
    public let favouritesCount:                Int
    public let followRequestSent:              Bool?
    public let following:                      Bool?  // deprecated
    public let followersCount:                 Int
    public let friendsCount:                   Int
    public let geoEnabled:                     Bool
    public let id:                             Int64
    public let idStr:                          String
    public let isTranslator:                   Bool
    public let lang:                           String
    public let listedCount:                    Int
    public let location:                       String?
    public let name:                           String
    public let notifications:                  Bool // deprecated
    public let profileBackgroundColor:         String
    public let profileBackgroundImageUrl:      String
    public let profileBackgroundImageUrlHttps: String
    public let profileBackgroundTile:          Bool
    public let profileBannerUrl:               String?
    public let profileImageUrl:                String
    public let profileImageUrlHttps:           String
    public let profileLinkColor:               String
    public let profileSidebarBorderColor:      String
    public let profileSidebarFillColor:        String
    public let profileTextColor:               String
    public let profileUseBackgroundImage:      Bool
    public let protected:                      Bool
    public let screenName:                     String
    public let showAllInlineMedia:             Bool?
    public let status:                         Tweet?
    public let statusesCount:                  Int
    public let timeZone:                       String?
    public let url:                            String?
    public let utcOffset:                      Int?
    public let verified:                       Bool
    public let withheldInCountries:            String?
    public let withheldScope:                  String?
}

extension User : Decodable {
    public static func decode(json: JSON) -> Decoded<User> {
        let a = curry(User.init)
            <^> json <|   "contributors_enabled"
            <*> json <|   "created_at"
            <*> json <|   "default_profile"
            <*> json <|   "default_profile_image"
            <*> json <|?  "description"
            <*> json <|   "entities"
        let b = a <*> json <|   "favourites_count"
            <*> json <|?  "follow_request_sent"
            <*> json <|?  "following"
            <*> json <|   "followers_count"
            <*> json <|   "friends_count"
            <*> json <|   "geo_enabled"
            <*> json <|   "id"
            <*> json <|   "id_str"
        let c = b <*> json <|   "is_translator"
            <*> json <|   "lang"
            <*> json <|   "listed_count"
            <*> json <|?  "location"
            <*> json <|   "name"
            <*> json <|   "notifications"
            <*> json <|   "profile_background_color"
            <*> json <|   "profile_background_image_url"
            <*> json <|   "profile_background_image_url_https"
        let d = c <*> json <|   "profile_background_tile"
            <*> json <|?  "profile_banner_url"
            <*> json <|   "profile_image_url"
            <*> json <|   "profile_image_url_https"
            <*> json <|   "profile_link_color"
            <*> json <|   "profile_sidebar_border_color"
            <*> json <|   "profile_sidebar_fill_color"
            <*> json <|   "profile_text_color"
        let e = d <*> json <|   "profile_use_background_image"
            <*> json <|   "protected"
            <*> json <|   "screen_name"
            <*> json <|?  "show_all_inline_media"
            <*> json <|?  "status"
            <*> json <|   "statuses_count"
            <*> json <|?  "time_zone"
        return e <*> json <|?  "url"
            <*> json <|?  "utc_offset"
            <*> json <|   "verified"
            <*> json <|?  "withheld_in_countries"
            <*> json <|?  "withheld_scope"
    }
}

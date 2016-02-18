//
//  RxTwiftUser.swift
//  Pods
//
//  Created by Mihyaeru on 2/18/16.
//
//

import Foundation

// https://dev.twitter.com/overview/api/users
public class RxTwiftUser {
    let contributorsEnabled: Bool
    let createdAt: String
    let defaultProfile: Bool
    let defaultProfileImage: Bool
    let description: String?
    let entities: RxTwiftUserEntities
    let favouritesCount: Int
    let followRequestSent: Bool?
    let following: Bool?  // deprecated
    let followersCount: Int
    let friendsCount: Int
    let geoEnabled: Bool
    let id: Int64
    let idStr: String
    let isTranslator: Bool
    let lang: String
    let listedCount: Int
    let location: String?
    let name: String
    let notifications: Bool // deprecated
    let profileBackgroundColor: String
    let profileBackgroundImageUrl: String
    let profileBackgroundImageUrlHttps: String
    let profileBackgroundTile: Bool
    let profileBannerUrl: String
    let profileImageUrl: String
    let profileImageUrlHttps: String
    let profileLinkColor: String
    let profileSidebarBorderColor: String
    let profileSidebarFillColor: String
    let profileTextColor: String
    let profileUseBackgroundImage: Bool
    let protected: Bool
    let screenName: String
    let showAllInlineMedia: Bool
    let status: [RxTwiftTweet]?
    let statusesCount: Int
    let timeZone: String?
    let url: String?
    let utcOffset: Int?
    let verified: Bool
    let withheldInCountries: String
    let withheldScope: String

    init(
        contributorsEnabled: Bool,
        createdAt: String,
        defaultProfile: Bool,
        defaultProfileImage: Bool,
        description: String?,
        entities: RxTwiftUserEntities,
        favouritesCount: Int,
        followRequestSent: Bool?,
        following: Bool?,
        followersCount: Int,
        friendsCount: Int,
        geoEnabled: Bool,
        id: Int64,
        idStr: String,
        isTranslator: Bool,
        lang: String,
        listedCount: Int,
        location: String?,
        name: String,
        notifications: Bool,
        profileBackgroundColor: String,
        profileBackgroundImageUrl: String,
        profileBackgroundImageUrlHttps: String,
        profileBackgroundTile: Bool,
        profileBannerUrl: String,
        profileImageUrl: String,
        profileImageUrlHttps: String,
        profileLinkColor: String,
        profileSidebarBorderColor: String,
        profileSidebarFillColor: String,
        profileTextColor: String,
        profileUseBackgroundImage: Bool,
        protected: Bool,
        screenName: String,
        showAllInlineMedia: Bool,
        status: [RxTwiftTweet]?,
        statusesCount: Int,
        timeZone: String?,
        url: String?,
        utcOffset: Int?,
        verified: Bool,
        withheldInCountries: String,
        withheldScope: String
    ) {
        self.contributorsEnabled            = contributorsEnabled
        self.createdAt                      = createdAt
        self.defaultProfile                 = defaultProfile
        self.defaultProfileImage            = defaultProfileImage
        self.description                    = description
        self.entities                       = entities
        self.favouritesCount                = favouritesCount
        self.followRequestSent              = followRequestSent
        self.following                      = following
        self.followersCount                 = followersCount
        self.friendsCount                   = friendsCount
        self.geoEnabled                     = geoEnabled
        self.id                             = id
        self.idStr                          = idStr
        self.isTranslator                   = isTranslator
        self.lang                           = lang
        self.listedCount                    = listedCount
        self.location                       = location
        self.name                           = name
        self.notifications                  = notifications
        self.profileBackgroundColor         = profileBackgroundColor
        self.profileBackgroundImageUrl      = profileBackgroundImageUrl
        self.profileBackgroundImageUrlHttps = profileBackgroundImageUrlHttps
        self.profileBackgroundTile          = profileBackgroundTile
        self.profileBannerUrl               = profileBannerUrl
        self.profileImageUrl                = profileImageUrl
        self.profileImageUrlHttps           = profileImageUrlHttps
        self.profileLinkColor               = profileLinkColor
        self.profileSidebarBorderColor      = profileSidebarBorderColor
        self.profileSidebarFillColor        = profileSidebarFillColor
        self.profileTextColor               = profileTextColor
        self.profileUseBackgroundImage      = profileUseBackgroundImage
        self.protected                      = protected
        self.screenName                     = screenName
        self.showAllInlineMedia             = showAllInlineMedia
        self.status                         = status
        self.statusesCount                  = statusesCount
        self.timeZone                       = timeZone
        self.url                            = url
        self.utcOffset                      = utcOffset
        self.verified                       = verified
        self.withheldInCountries            = withheldInCountries
        self.withheldScope                  = withheldScope
    }
}

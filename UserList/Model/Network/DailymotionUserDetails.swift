//
//  DailymotionUserDetails.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

struct DailymotionUserDetails: Codable {
    var login: String?
    var avatarUrl: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case login = "username"
        case avatarUrl = "avatar_360_url"
        case name = "screenname"
    }
    
    init() {
        
    }
}

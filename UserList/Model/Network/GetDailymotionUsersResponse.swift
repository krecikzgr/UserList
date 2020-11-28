//
//  GetDailymotionUsersResponse.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

struct GetDailymotionUsersResponse: Codable {
    let page, limit: Int?
    let explicit: Bool?
    let total: Int?
    let hasMore: Bool?
    let list: [DailymotionUser]?
    
    enum CodingKeys: String, CodingKey {
        case page, limit, explicit, total
        case hasMore = "has_more"
        case list
    }
}

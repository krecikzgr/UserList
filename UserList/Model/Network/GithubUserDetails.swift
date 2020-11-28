//
//  GithubUserDetails.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

struct GithubUserDetails: Codable {
    var login: String?
    var id: Int?
    var avatarUrl: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case name
    }
    
    init() {
        
    }
}
//
//  User.swift
//  GitHub
//
//  Created by Adrian Kaleta on 29/11/2020.
//

import Foundation

struct GithubUser: Codable {
    var login: String?
    var avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
    
    init() {}
}



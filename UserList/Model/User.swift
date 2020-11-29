//
//  User.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation
import NetworkingLibrary

enum ApiSource {
    case dailymotion
    case github
    
    func getDescription() -> String {
        switch self {
        case .dailymotion:
            return "Dailymotion"
        case .github:
            return "Github"
        }
    }
}

struct User {
    var login: String?
    var avatarUrl: String?
    var source: ApiSource?
    
    init(_ user: GithubUser) {
        self.login = user.login
        self.avatarUrl = user.avatarUrl
        self.source = .github
    }
    
    init(_ user: DailymotionUser) {
        self.login = user.login
        self.avatarUrl = user.avatarUrl
        self.source = .dailymotion
    }
}

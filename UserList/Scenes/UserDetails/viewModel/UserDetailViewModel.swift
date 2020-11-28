//
//  UserDetailViewModel.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

struct UserDetailViewModel {
    
    // MARK: - Public properties
    
    var title:String?
    var avatarUrl: String?
    var name: String?
    var source: ApiSource?
    
    // MARK: - Initialization
    
    init(_ userDetails: GithubUserDetails) {
        self.title = userDetails.login
        self.avatarUrl = userDetails.avatarUrl
        self.name = userDetails.name
        self.source = .github
    }
    
    init(_ userDetails: DailymotionUserDetails) {
        self.title = userDetails.login
        self.avatarUrl = userDetails.avatarUrl
        self.name = userDetails.name
        self.source = .dailymotion
    }
}

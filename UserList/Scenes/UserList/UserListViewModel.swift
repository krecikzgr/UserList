//
//  UserListViewModel.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

struct UserListViewModel {
    
    // MARK: - Public properties

    var name: String?
    var avatarUrl: String?
    var source: ApiSource?
    
    // MARK: - Initialization
    
    init(user: User) {
        self.name = user.login
        self.avatarUrl = user.avatarUrl
        self.source = user.source
    }
}

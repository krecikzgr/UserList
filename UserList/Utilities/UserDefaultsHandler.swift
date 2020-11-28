//
//  UserDefaultsHandler.swift
//  UserList
//
//  Created by Adrian Kaleta on 27/11/2020.
//

import Foundation

enum UserDefaultsKeys: String {
    case favoriteItems
}

class UserDefaultsHandler {
    
    // MARK: - Public properties
    
    func setFavorites(_ array:[Int]) {
        UserDefaults.standard.setValue(array, forKey: UserDefaultsKeys.favoriteItems.rawValue)
    }
    
    func getFavorites() -> [Int]{
        return UserDefaults.standard
            .value(forKey: UserDefaultsKeys.favoriteItems.rawValue) as? [Int] ?? []
    }
}

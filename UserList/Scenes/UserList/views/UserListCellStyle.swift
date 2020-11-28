//
//  UserListCellStyle.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

struct UserListCellStyle {
    static let height: CGFloat = 44.0
    
    struct Icon {
        static let left: CGFloat = 8.0
        static let size: CGFloat = 27.0
    }
    
    struct Title {
        static let right: CGFloat = 8.0
    }
    
    struct Source {
        static let left: CGFloat = 8.0
        static let right: CGFloat = 8.0
        static let width: CGFloat = 100.0
        static let textAlignment: NSTextAlignment = .right
        static let color: UIColor = .gray
    }
}

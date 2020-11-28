//
//  UITableViewCell+Extensions.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

public extension UITableViewCell {
    class func defaultIdentifier() -> String {
        return String(describing: self)
    }
}

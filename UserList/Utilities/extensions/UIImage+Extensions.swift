//
//  UIImage + Extensions.swift
//  UserList
//
//  Created by Adrian Kaleta on 27/11/2020.
//

import UIKit

extension UIImage {
    class func image(_ image: Images) -> UIImage {
        return UIImage(named: image.rawValue)?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
}

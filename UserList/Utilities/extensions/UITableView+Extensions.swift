//
//  UITableView+Extensions.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(withClass `class`: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: `class`.defaultIdentifier()) as? T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass `class`: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: `class`.defaultIdentifier(), for: indexPath as IndexPath) as? T else {
            fatalError("Error: cell with identifier: \(`class`.defaultIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(cellClass `class`: T.Type) {
        register(`class`, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func registerCellNibForClass(nibClass: UITableViewCell.Type, reuseIdentifier: String? = nil) {
        let className = nibClass.defaultIdentifier()
        register(UINib(nibName: className, bundle: Bundle(for: nibClass)), forCellReuseIdentifier: reuseIdentifier ?? className)
    }
    
    func register<T: UITableViewCell>(nib: UINib, forClass `class`: T.Type) {
        register(nib, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
}

//
//  UIViewController+Extensions.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit


extension UIViewController {
    class func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name:String(describing: self), bundle:Bundle(for: self as AnyClass))
        return storyboard.instantiateInitialViewController() as! Self
    }
    
    func showError(message:String) {
        let alertController = UIAlertController(title: "Error",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

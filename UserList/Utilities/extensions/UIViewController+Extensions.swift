//
//  UIViewController+Extensions.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit


extension UIViewController {
    func showError(message:String) {
        let alertController = UIAlertController(title: "Error",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

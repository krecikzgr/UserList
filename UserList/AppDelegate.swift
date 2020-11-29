//
//  AppDelegate.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationViewController = UINavigationController()
        let userListViewController = UserListController()
        navigationViewController.viewControllers = [userListViewController]
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationViewController
        return true
    }
}


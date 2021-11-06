//
//  AppDelegate.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setRootViewController()
        
        return true
    }

    func setRootViewController() {
        let mainViewController = PostAdMainController()
        
        if let window = window {
            window.rootViewController = mainViewController
            window.makeKeyAndVisible()
        }
    }

}


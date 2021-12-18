//
//  AppDelegate.swift
//  PerlinNoise
//
//  Created by Admin on 16.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = UIWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = NoiseController()
        window?.makeKeyAndVisible()
        return true
    }
}


//
//  AppDelegate.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        presentInitialScreen(in: window)
        return true
    }
    
    func presentInitialScreen(in window: UIWindow?) {
        let rootVC = ViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
    
}

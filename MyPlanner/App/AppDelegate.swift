//
//  AppDelegate.swift
//  MyPlanner
//
//  Created by Boris Bolshakov on 13.01.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
   
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    


}


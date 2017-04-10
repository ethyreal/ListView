//
//  AppDelegate.swift
//  ListViewExamples
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var coordinator:AppCoordinator?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.coordinator = AppCoordinator(window:window)
        self.window = window
        self.coordinator?.start()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    
}


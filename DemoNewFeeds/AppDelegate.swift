//
//  AppDelegate.swift
//  demoBasicUserControl
//
//  Created by quannh on 8/11/20.
//  Copyright © 2020 quannh. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        Setup rootViewController Using navigation controller
//        let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
//        let rootViewController:UIViewController = storyboard.instantiateViewController(withIdentifier: "root") as UIViewController
//        navigationController.viewControllers = [rootViewController]
//        self.window?.rootViewController = navigationController
//        self.window?.makeKeyAndVisible()
        
//        Without navigation controller
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "root")
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle
}

//
//  AppDelegate.swift
//  Switcher
//
//  Created by Schaban Bochi on 12.10.22.
//

import UIKit
import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var engine: FlutterEngine = {
      let result = FlutterEngine.init(name: "Switcher")
      result.run()
      return result
    }()

    let engines = FlutterEngineGroup(name: "multiple-flutters", project: nil)


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        let navigation = UINavigationController(rootViewController: ViewController())
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UITabBarViewController()
        return true
    }
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}


//
//  AppDelegate.swift
//  SNTemplate
//
//  Created by Matheus Sanada on 23/05/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let launcher: Launcher = AppLauncher()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()

        guard #available(iOS 13.0, *) else {
            debugPrint(">>> 12-")
            var coordinator: SNCoordinator!
            if Auth.auth().currentUser != nil {
                coordinator = MainCoordinator(with: .init())
            } else {
                coordinator = LoginCoordinator(with: .init())
            }
            coordinator.start()

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = coordinator.presenter
            window?.makeKeyAndVisible()
            return true
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

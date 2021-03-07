//
//  AppDelegate.swift
//  StateRestoreDemo
//
//  Created by Yash Jivani on 04/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
    
    
    //MARK:- Restore Methods
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        // encode any state at the app delegate level

    }
    
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
       UIApplication.shared.extendStateRestoration()
        DispatchQueue.main.async {
            UIApplication.shared.completeStateRestoration()
        }
        
        if let restoreBundleVersion =   coder.decodeObject(forKey: UIApplication.stateRestorationBundleVersionKey) as? String{
            print("Restore bundle version: \(restoreBundleVersion)")
        }
        
        if let restoreUserInterfaceIdiom =   coder.decodeObject(forKey: UIApplication.stateRestorationUserInterfaceIdiomKey) as? Int{
            print("Restore User Interface Idiom: \(restoreUserInterfaceIdiom)")
        }
    }
    


}


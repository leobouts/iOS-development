//
//  AppDelegate.swift
//  iShopList
//
//  Created by Leonidas on 02/05/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var firstLoad: Bool?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        //configures the firebase
        
        FIRApp.configure()
        
        //copy the firebase database locally, so the app can be used offline

        FIRDatabase.database().persistenceEnabled = true
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 1, green: 0.6237024598, blue: 0.4429502448, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        loadUserDefaults()
        
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            
            if user != nil {
                
                if userDefaults.object(forKey: kCURRENTUSER) != nil {
                    
                    self.goToApp()
                }
            }
            
        })
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
            }

    func applicationDidEnterBackground(_ application: UIApplication) {
            }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    //MARK: Go to app
    
    func goToApp() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! UITabBarController
        
        vc.selectedIndex = 0
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
    }
    
    func loadUserDefaults() {
        
        firstLoad = userDefaults.bool(forKey: kFIRSTRUN)
        
        if !firstLoad! {
            
            userDefaults.set(true, forKey: kFIRSTRUN)
            userDefaults.set("€", forKey: kCURRENCY)
            userDefaults.synchronize()
            
        }
    }



}


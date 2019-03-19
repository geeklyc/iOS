//
//  AppDelegate.swift
//  CoreDataDemo
//
//  Created by liyoucheng on 2019/3/15.
//  Copyright © 2019年 JZYI. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var persistentContainer: NSPersistentContainer!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        createMoodyContainer { (container) in
            
            self.persistentContainer = container
            let storyboard = self.window?.rootViewController?.storyboard
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? RootViewController else {
                
                fatalError("Cannot instantiate root view controller")
            }
            vc.managedObjectContext = container.viewContext
            self.window?.rootViewController = vc
        }
        
        return true
    }

    func createMoodyContainer(completion:@escaping(NSPersistentContainer) -> ()) {
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores { (_, error) in
            
            // 开发环境：直接让程序奔溃
            // 生成环境：做不同的反应，比如：迁移已有的的存储到新的版本。或者删除并重新创建这个存储
            guard error == nil else {
                
                fatalError("Failed to load store:\(error!)")
            }
            DispatchQueue.main.async {
                
                completion(container)
            }
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


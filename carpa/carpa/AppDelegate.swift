//
//  AppDelegate.swift
//  carpa
//
//  Created by MacBook Pro on 13/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
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
    
    //CoreData stack
    
    lazy var persistenceContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ParkingModel")
        
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError?{
                print(#function, "Unable to get PersistenceStore \(error)")
            }
        })
        return container
    }()
    
    //CoreData Saving Support
    func saveContext(){
        let context = persistenceContainer.viewContext
        
        if context.hasChanges{
            do{
                try context.save()
            }catch {
                let nserror = error as NSError
                print(#function, "Unable to save database changes \(nserror)")
            }
        }
    }

}


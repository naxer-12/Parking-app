//
//  CoreDataStorage.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
import CoreData


final class CoreDataStorage{
    
    //CoreData stack
    private init(){}
    static let shared = CoreDataStorage()
       lazy var persistenceContainer : NSPersistentContainer = {
           let container = NSPersistentContainer(name: "ParkingModel")
           
           container.loadPersistentStores(completionHandler: {(storeDescription, error) in
               if let error = error as NSError?{
                   print(#function, "Unable to get PersistenceStore \(error)")
               }
           })
           return container
       }()
       lazy var context = persistenceContainer.viewContext
       //CoreData Saving Support
       func saveContext(){
           
           if context.hasChanges{
               do{
                   try context.save()
                debugPrint("SAVE CONTEXT ACTIVATED")
               }catch {
                   let nserror = error as NSError
                   print(#function, "Unable to save database changes \(nserror)")
               }
           }
       }
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
       {
           do {
               guard let result = try CoreDataStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
               return result

           } catch let error {
               debugPrint(error)
           }

           return nil
       }
}

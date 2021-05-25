// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  UserProfileRepo.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
import CoreData

struct UserProfileRepo: BaseRepository {
    func createRecord(record: UserProfile) {
        
        
        let userData=User(context: CoreDataStorage.shared.context)
        userData.name=record.name
        userData.email=record.email
        userData.password=record.password
        userData.carPlateNumber = record.carPlateNumber
        userData.contactNumber=record.contactNumber
        userData.userId = record.userId
        CoreDataStorage.shared.saveContext()
        
        debugPrint("USER CREATED")
    }
    
    func getAll() -> [UserProfile]? {
        // TODO
        return [] as? [UserProfile]
    }
    
    func get(byIdentifier id: UUID) -> UserProfile? {
        let userProfile = getUser(byId: id)
        guard userProfile != nil else {return nil}
        
        return (userProfile?.convertToUser())!
    }
    
    func updateRecord(record: UserProfile) -> Bool {
        let userProfile = getUser(byId: record.userId)
        guard userProfile != nil else {return false}
        userProfile?.name = record.name
        userProfile?.email=record.email
        userProfile?.password=record.password
        userProfile?.carPlateNumber = record.carPlateNumber
        userProfile?.contactNumber=record.contactNumber
//        if(record.parkingRecords != nil && record.parkingRecords?.count != 0)
//        {
//            var parkRecords = Set<Parking>()
//            record.parkingRecords?.forEach({ (parkRec) in
//
//                let parkingRec = Parking(context: CoreDataStorage.shared.context)
//                parkingRec.buildingCode = parkRec.bcode
//                parkingRec.carPlateNo = parkRec.carPlate
//                parkingRec.date = parkRec.parkingDate
//                parkingRec.parkingHours = parkRec.noOfHours
//                parkingRec.parkingId = parkRec.parkId
//                parkingRec.parkingLat = parkRec.parkLat ?? 0.0
//                parkingRec.parkingLong = parkRec.parkLon ?? 0.0
//                parkingRec.parkingStreetAddress = parkRec.parkStreetAddr
//                parkingRec.userCurrentLan = parkRec.currentLan ?? 0.0
//                parkingRec.userCurrentLat = parkRec.currentLat ?? 0.0
//                parkingRec.suitNoOfHost = parkRec.noOfHost
//                parkRecords.insert(parkingRec)
//            })
//
//            userProfile?.parkingRecords = parkRecords
//        }
        
        CoreDataStorage.shared.saveContext()
        return true
    }
    
    func deleteRecord(byIdentifier id: UUID) -> Bool {
        print("ID \(id.uuidString)")
        
        let userProfile = getUser(byId: id)
        guard userProfile != nil else {return false}
        print("GETTING USER PROFILE \(userProfile?.name)")
        CoreDataStorage.shared.context.delete(userProfile!)
        CoreDataStorage.shared.saveContext()
        
        return true
    }
    
    private func getUser(byId id: UUID) -> User?
    {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let fetchById = NSPredicate(format: "userId==%@", id as CVarArg)
        fetchRequest.predicate = fetchById
        let result = try! CoreDataStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        
        return result.first
    }
    
    
    func checkUserExist(byEmail email:String)->UserProfile?{
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let fetchByEmail = NSPredicate(format: "email==%@", email as CVarArg)
        fetchRequest.predicate = fetchByEmail
        let result = try! CoreDataStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        return (result.first?.convertToUser())!
    }
    typealias T = UserProfile
    
    
    
}

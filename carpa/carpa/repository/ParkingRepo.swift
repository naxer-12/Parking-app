//
//  ParkingRepository.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
import CoreData

struct ParkingRepo: BaseRepository {
    
    func createRecord(record: ParkingModel) {
        let parkingData=Parking(context: CoreDataStorage.shared.context)
        
        parkingData.buildingCode = record.buildingCode
        parkingData.carPlateNo = record.carPlateNo
        parkingData.date = record.dateTimeOfParking
        parkingData.parkingHours = record.parkingHours
        parkingData.parkingId = record.parkingId
        parkingData.parkingLat = record.parkingLat!
        parkingData.parkingLong = record.parkingLng!
        parkingData.parkingStreetAddress = record.parkingStreetAddress
        parkingData.suitNoOfHost = record.suitNoOfHost
        CoreDataStorage.shared.saveContext()
        
        debugPrint("PARKING CREATED")
    }
    
    func deleteRecord(byIdentifier id: UUID) -> Bool {
        // No delete
        return false
    }
    
    func getAll() -> [ParkingModel]? {
        return [] as? [ParkingModel]
    }
    
    func get(byIdentifier id: UUID) -> ParkingModel? {
        let parkingModel = getParking(byId: id)
        guard parkingModel != nil else {return nil}
        
        return (parkingModel?.convertToParking())!
    }
    
    func updateRecord(record: ParkingModel) -> Bool {
        // No update
        return false
    }
    
    private func getParking(byId id: UUID) -> Parking?
    {
        let fetchRequest = NSFetchRequest<Parking>(entityName: "Parking")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById
        let result = try! CoreDataStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        
        return result.first
    }

    typealias T = ParkingModel
}

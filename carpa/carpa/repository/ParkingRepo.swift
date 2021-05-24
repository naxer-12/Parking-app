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
    
    func get(byIdentifier id: UUID) -> ParkingModel? {
//        let parking = getParking(byId: <#T##UUID#>)
//        guard parking != nil else {return nil}
//
//        return (parking?.convertToParking()())!
        return nil
    }
    
    
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
    
    func getAllParkings(carPlateNo : String?) -> [ParkingModel]{
            var parkingArr:[ParkingModel] = [ParkingModel]()
            let fetchRequest = NSFetchRequest<Parking>(entityName: "Parking")
//            let carPlateNo: String = UserDefaults.standard.value(forKey: "carPlateNo") as! String
//            print("Session CarPlate No: \(carPlateNo)")
        let predicate = NSPredicate(format: "carPlateNo == %@", carPlateNo as! CVarArg)
            fetchRequest.predicate = predicate
            do{
                let result = try! CoreDataStorage.shared.context.fetch(fetchRequest)
//                let result = try moc.fetch(fetchRequest)
                let parkingList = result as [Parking]
                for parkingData in parkingList{
                    var pModel: ParkingModel = ParkingModel(buildingCode: parkingData.buildingCode, carPlateNo: parkingData.carPlateNo, dateTimeOfParking: parkingData.date, parkingHours: parkingData.parkingHours, parkingId: parkingData.parkingId, parkingLat: parkingData.parkingLat, parkingLng: parkingData.parkingLong, parkingStreetAddress: parkingData.parkingStreetAddress, suitNoOfHost: parkingData.suitNoOfHost)
                        parkingArr.append(pModel)
                    //                    print("Building Code: \(parkindData.buildingCode!)\nTime of Parking: \(parkindData.timeOfParking)\nSuitNoofHost \(parkindData.suitNoOfHost!)\nCar Plate Number\(parkindData.carPlateNo!)\nNumber of Hrs Intended\(parkindData.noOfHrsIntended)\nLatitude\(parkindData.latitude)\nLongitude\(parkindData.longitude)")
                }
            }catch let error{
                print(#function, "Couldn't fetch records", error.localizedDescription)
            }
            return parkingArr
        }
    
//    func get(byIdentifier w: UUID) -> ParkingModel? {
//        let parkingModel = getParking(byId: id)
//        guard parkingModel != nil else {return nil}
//
//        return (parkingModel?.convertToParking())!
//    }
    
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

//
//  Parking+CoreDataProperties.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//
//

import Foundation
import CoreData


extension Parking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Parking> {
        return NSFetchRequest<Parking>(entityName: "Parking")
    }
    
    @NSManaged public var userId: UUID?
    @NSManaged public var buildingCode: String?
    @NSManaged public var carPlateNo: String?
    @NSManaged public var parkingLat: Double
    @NSManaged public var parkingLong: Double
    @NSManaged public var parkingHours: String?
    @NSManaged public var parkingId: UUID?
    @NSManaged public var parkingStreetAddress: String?
    @NSManaged public var suitNoOfHost: String?
    @NSManaged public var date: Date?
    @NSManaged public var userCurrentLat: Double
    @NSManaged public var userCurrentLan: Double
    @NSManaged public var userStreetAddress: String?
    @NSManaged public var toUser: User?

}

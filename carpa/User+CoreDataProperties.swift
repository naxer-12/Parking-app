// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  User+CoreDataProperties.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var carPlateNumber: String?
    @NSManaged public var contactNumber: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var userId: UUID?
    @NSManaged public var name: String?
    @NSManaged public var parkingRecords: Set<Parking>?

}

// MARK: Generated accessors for parkingRecords
extension User {

    @objc(addParkingRecordsObject:)
    @NSManaged public func addToParkingRecords(_ value: Parking)

    @objc(removeParkingRecordsObject:)
    @NSManaged public func removeFromParkingRecords(_ value: Parking)

    @objc(addParkingRecords:)
    @NSManaged public func addToParkingRecords(_ values: Set<Parking>)

    @objc(removeParkingRecords:)
    @NSManaged public func removeFromParkingRecords(_ values: Set<Parking>)

}

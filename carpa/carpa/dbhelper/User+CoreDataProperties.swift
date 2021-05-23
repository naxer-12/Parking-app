//
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

}

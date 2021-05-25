// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  UserProfile.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation


class UserProfile{
     init(name: String, email: String, password: String, contactNumber: String, carPlateNumber: String, userId: UUID, parkingRecords: [ParkingModel]? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.contactNumber = contactNumber
        self.carPlateNumber = carPlateNumber
        self.userId = userId
        self.parkingRecords = parkingRecords
    }
    
    
    
    
    
    let name:String
    let email:String
    let password:String
    let contactNumber:String
    let carPlateNumber:String
    let userId:UUID
    var parkingRecords:[ParkingModel]?

}

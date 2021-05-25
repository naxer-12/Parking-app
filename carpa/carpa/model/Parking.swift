// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  Parking.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation

class ParkingModel{
    init(userId:UUID?, buildingCode: String?, carPlateNo: String?, dateTimeOfParking:Date?, parkingHours: String?, parkingId: UUID?, parkingLat: Double?, parkingLng: Double?, parkingStreetAddress: String?, suitNoOfHost: String?) {
        self.userId = userId
        self.buildingCode = buildingCode
        self.carPlateNo = carPlateNo
        self.dateTimeOfParking = dateTimeOfParking
        self.parkingHours = parkingHours
        self.parkingId = parkingId
        self.parkingLat = parkingLat
        self.parkingLng = parkingLng
        self.parkingStreetAddress = parkingStreetAddress
        self.suitNoOfHost = suitNoOfHost
    }
    
    let userId: UUID?, buildingCode: String?, carPlateNo: String?, dateTimeOfParking:Date?, parkingHours: String?, parkingId: UUID?, parkingLat: Double?, parkingLng: Double?, parkingStreetAddress: String?, suitNoOfHost: String?
}
    

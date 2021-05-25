// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  ParkingExtension.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
extension Parking
{
    func convertToParking() -> ParkingModel
    {
        return ParkingModel(userId: self.userId!, buildingCode: self.buildingCode!, carPlateNo: self.carPlateNo!, dateTimeOfParking: self.date, parkingHours: self.parkingHours, parkingId: self.parkingId!, parkingLat: self.parkingLat, parkingLng: self.parkingLong, parkingStreetAddress: self.parkingStreetAddress!, suitNoOfHost: self.suitNoOfHost!)
        
    }
}

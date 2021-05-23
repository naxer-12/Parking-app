//
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
        return ParkingModel(bcode: self.buildingCode!, noOfHours:self.parkingHours!, carPlate: self.carPlateNo!, noOfHost: self.suitNoOfHost!, parkingDate: self.date!, currentLat: self.userCurrentLat, currentLan: self.userCurrentLan, currentStreetAddr: self.userStreetAddress, parkLat: self.parkingLat, parkLon: self.parkingLong, parkStreetAddr: self.parkingStreetAddress, parkId: self.parkingId!)
        
    }
}

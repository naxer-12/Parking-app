//
//  UserExtension.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
extension User
{
    func convertToUser() -> UserProfile
    {
//        return Person(_id: self.id!, _name: self.name!, _vehicle: self.convertToVechiles())
        return UserProfile(
            name: self.name!, email: self.email!, password: self.password!, contactNumber: self.contactNumber!, carPlateNumber: self.carPlateNumber!, userId: self.userId!, parkingRecords: self.convertToParkRecords()
        )
    }

    private func convertToParkRecords() -> [ParkingModel]?
    {
        guard self.parkingRecords != nil && self.parkingRecords?.count != 0 else {return nil}

        var parkingRec: [ParkingModel] = []

        self.parkingRecords?.forEach({ (parkRec) in
            parkingRec.append(parkRec.convertToParking())
        })

        return parkingRec
    }
}

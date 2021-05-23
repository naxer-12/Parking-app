//
//  Parking.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation

class ParkingModel{
     init(bcode: String?, noOfHours: String?, carPlate: String?, noOfHost: String?, parkingDate: Date?, currentLat: Double?, currentLan: Double?, currentStreetAddr: String?, parkLat: Double?, parkLon: Double?, parkStreetAddr: String?, parkId: UUID?) {
        self.bcode = bcode
        self.noOfHours = noOfHours
        self.carPlate = carPlate
        self.noOfHost = noOfHost
        self.parkingDate = parkingDate
        self.currentLat = currentLat
        self.currentLan = currentLan
        self.currentStreetAddr = currentStreetAddr
        self.parkLat = parkLat
        self.parkLon = parkLon
        self.parkStreetAddr = parkStreetAddr
        self.parkId = parkId
    }
    
     
    
    let bcode:String?
    let noOfHours:String?
    let carPlate:String?
    let noOfHost:String?
    let parkingDate:Date?
    let currentLat:Double?
    let currentLan:Double?
    let currentStreetAddr:String?
    let parkLat:Double?
    let parkLon:Double?
    let parkStreetAddr:String?
    let parkId:UUID?
    
}
    

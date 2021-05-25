//
//  AppStore.swift
//  carpa
//
//  Created by MacBook Pro on 24/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
class AppStore{
    private let defaults = UserDefaults.standard
    
    
    func saveUserEmail(email:String){
        defaults.setValue(email, forKey: "UserEmail")
    }
    
    func saveCarPlateNo(carPlateNo:String){
        defaults.setValue(carPlateNo, forKey: "CarPlateNo")
    }
    
    func getUserEmail()->String{
        return defaults.string(forKey: "UserEmail") ?? ""
    }
    
    func getCarPlateNo()->String{
        return defaults.string(forKey: "CarPlateNo") ?? ""
    }
    
    func isUserLoggedIn()->Bool{
        return defaults.bool(forKey: "isUserLoggedIn") 
    }
    
    
    func setUserLoggedIn(isUserLoggedIn:Bool){
        defaults.setValue(isUserLoggedIn, forKey: "isUserLoggedIn")
    }
    
    
    func saveUserId(currentUserId:String){
        defaults.setValue(currentUserId, forKey: "currentUserId")
    }
    
    func getUserId()->String{
        return defaults.string(forKey: "currentUserId") ?? ""

    }
}

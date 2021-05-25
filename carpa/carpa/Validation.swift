// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  Validation.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-24.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
struct Validation {
    
    public static func validateBuildingCode(buildingCode : String) -> Bool {
        // Length must be exactly 5 alphanumeric characters
        let buildingCodeRegex = "^[a-zA-Z0-9]{5}$"
        let trimmedString = buildingCode.trimmingCharacters(in: .whitespaces)
        let validateBuildingCode = NSPredicate(format: "SELF MATCHES %@", buildingCodeRegex)
        let isValidateBuildingCode = validateBuildingCode.evaluate(with: trimmedString)
        return isValidateBuildingCode
    }
    
    public static func validateCarLicensePlate(carLicenseNo : String) -> Bool {
        // length must be minimum 2 and maximum 8 alphanumeric characters
        let carLicenseNoRegex = "^[a-zA-Z0-9]{2,8}$"
        let trimmedString = carLicenseNo.trimmingCharacters(in: .whitespaces)
        let validateCarLicenseNo = NSPredicate(format: "SELF MATCHES %@", carLicenseNoRegex)
        let isValidateCarLicenseNo = validateCarLicenseNo.evaluate(with: trimmedString)
        return isValidateCarLicenseNo
    }
    
    public static func validateSuitNoOfHost(suitNoOfHost : String) -> Bool {
        // length must be minimum 2 and maximum 5 alphanumeric characters
        let suitNoOfHostRegex = "^[a-zA-Z0-9]{2,5}$"
        let trimmedString = suitNoOfHost.trimmingCharacters(in: .whitespaces)
        let validateSuitNoOfHost = NSPredicate(format: "SELF MATCHES %@", suitNoOfHostRegex)
        let isValidateSuitNoOfHost = validateSuitNoOfHost.evaluate(with: trimmedString)
        return isValidateSuitNoOfHost
    }
}

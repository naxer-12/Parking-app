//
//  StringExtension.swift
//  carpa
//
//  Created by MacBook Pro on 22/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
extension String {
  
  func isValidEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
  
    func getCurrentPath(){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        
    }
  
}

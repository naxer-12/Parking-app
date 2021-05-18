// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  signup.swift
//  carpa
//
//  Created by MacBook Pro on 14/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class signup: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "View All", style: .plain, target: self, action: #selector(viewAllBtnClicked))

    }
    
    @objc
    func viewAllBtnClicked() {
        print("view all button clicked")
        
        let parkingListViewController = self.storyboard?.instantiateViewController(identifier: "parking_list") as! ParkingTableViewController
        
        self.navigationController?.pushViewController(parkingListViewController, animated: true)


    }

}


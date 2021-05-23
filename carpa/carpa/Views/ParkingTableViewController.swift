//
//  ParkingTableViewController.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-18.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class ParkingTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ParkingTableViewCell")
                
                if (cell == nil) {
                    cell = UITableViewCell(
                        style: UITableViewCell.CellStyle.default,
                        reuseIdentifier: "ParkingTableViewCell")
                }
                
                return cell!
                
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Park car", style: .plain, target: self, action: #selector(addParkingBtnClicked))

        
    }

    @objc
       func addParkingBtnClicked() {
            print("add parking button clicked")
            let addParkingViewController = self.storyboard?.instantiateViewController(identifier: "add_parking") as! AddParkingViewController
            
            self.navigationController?.pushViewController(addParkingViewController, animated: true)
       }
    
    @IBOutlet weak var parkingTableView: UITableView!
    
    

}
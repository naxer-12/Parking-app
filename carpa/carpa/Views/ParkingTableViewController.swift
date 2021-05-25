//
//  ParkingTableViewController.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-18.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class ParkingTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let parkingRepo : ParkingRepo = ParkingRepo()
    let appStore : AppStore = AppStore()
    var userId : UUID?
    var userEmail : String?
    var parkingRecords : [ParkingModel] = []
    
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.parkingRecords.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "parking_cell", for: indexPath) as! ParkingTableViewCell
        cell.txtStreetAddress.text = "\(parkingRecords[indexPath.row].parkingStreetAddress!)"
        cell.txtHoursParked.text = "\(parkingRecords[indexPath.row].parkingHours!)"
        cell.txtCarPlateNo.text = "\(parkingRecords[indexPath.row].carPlateNo!)"
                print(parkingRecords[indexPath.row].parkingHours!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let parkingDetails = storyboard?.instantiateViewController(identifier: "parking_details") as? ParkingDetailsViewController else {
                print(#function, "Cannot find the parking detials view controller")
                return
            }
        parkingDetails.parkingData = parkingRecords[indexPath.row]
        show(parkingDetails, sender: self)
    }
    
    @IBOutlet weak var parkingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Park car", style: .plain, target: self, action: #selector(addParkingBtnClicked))
        
        userId = UUID(uuidString: appStore.getUserId())
        parkingRecords = parkingRepo.getAllParkings(userId: userId)
        parkingTable.dataSource = self
        parkingTable.delegate = self
        parkingTable.rowHeight = 170
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        parkingRecords = parkingRepo.getAllParkings(userId: userId)
       parkingTable.reloadData()
   }

    @objc
       func addParkingBtnClicked() {
            print("add parking button clicked")
            let addParkingViewController = self.storyboard?.instantiateViewController(identifier: "add_parking") as! AddParkingViewController
            
            self.navigationController?.pushViewController(addParkingViewController, animated: true)
       }
    
    @IBOutlet weak var parkingTableView: UITableView!
    
    

}

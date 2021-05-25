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
    var carPlateNo : String?
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
                
//                if (cell == nil) {
//                    cell = UITableViewCell(
//                        style: UITableViewCell.CellStyle.default,
//                        reuseIdentifier: "parking_cell") as! ParkingTableViewCell
//                }
//        ce.text = "\(parkingRecords[indexPath.row].buildingCode!)"
        cell.txtStreetAddress.text = "\(parkingRecords[indexPath.row].parkingStreetAddress!)"
        cell.txtHoursParked.text = "\(parkingRecords[indexPath.row].parkingHours!)"
        
                print(parkingRecords[indexPath.row].parkingHours!)
        
        return cell
                
    }
    
    @IBOutlet weak var parkingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Park car", style: .plain, target: self, action: #selector(addParkingBtnClicked))
        carPlateNo = appStore.getCarPlateNo()
        parkingRecords = parkingRepo.getAllParkings(carPlateNo:carPlateNo)
        parkingTable.dataSource = self
        parkingTable.delegate = self
        parkingTable.rowHeight = 170
        


    }

    @objc
       func addParkingBtnClicked() {
            print("add parking button clicked")
            let addParkingViewController = self.storyboard?.instantiateViewController(identifier: "add_parking") as! AddParkingViewController
            
            self.navigationController?.pushViewController(addParkingViewController, animated: true)
       }
    
    @IBOutlet weak var parkingTableView: UITableView!
    
    

}

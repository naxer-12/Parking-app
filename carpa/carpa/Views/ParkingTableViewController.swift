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
    private let userProfileRepo:UserProfileRepo = UserProfileRepo()
    

    
    
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
    
    private func initalizeButton() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let settingsButton = UIBarButtonItem(title: NSString(string: "\u{2699}\u{0000FE0E}") as String, style: .plain, target: self, action: #selector(settingBtnClicked))
        let font = UIFont.systemFont(ofSize: 30)
        let attributes = [NSAttributedString.Key.font : font]
        settingsButton.setTitleTextAttributes(attributes, for: .normal)
        
        navigationItem.leftBarButtonItem = settingsButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeButton()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Park car", style: .plain, target: self, action: #selector(addParkingBtnClicked))
        carPlateNo = appStore.getCarPlateNo()
        parkingRecords = parkingRepo.getAllParkings(carPlateNo:carPlateNo)
        parkingTable.dataSource = self
        parkingTable.delegate = self
        parkingTable.rowHeight = 170
        


    }
     func navigateToSignIn(){
         self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    func settingBtnClicked() {
        let alert = UIAlertController(title: "User Settings", message: "Please Select an Option", preferredStyle: .actionSheet)
           
           alert.addAction(UIAlertAction(title: "Update Account Details", style: .default , handler:{ (UIAlertAction)in
            let updateViewController = self.storyboard?.instantiateViewController(identifier: "Update_Screen") as! UpdateViewController
            
            self.navigationController?.pushViewController(updateViewController, animated: true)
           }))
           
           alert.addAction(UIAlertAction(title: "Sign out", style: .default , handler:{ (UIAlertAction)in
            
            self.appStore.removeUserData()
            
            self.navigateToSignIn()

            
           }))

           alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction)in


                   let alert = UIAlertController(title: "Delete", message: "Your account will be deleted", preferredStyle: .alert)
            
            
            alert.addAction(UIKit.UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addAction(UIKit.UIAlertAction(title: "Delete", style: .destructive, handler: {_ in
               
                let id = self.appStore.getUserId()
                
                
                let result = self.userProfileRepo.deleteRecord(byIdentifier: UUID(uuidString: id)!)
                
                
                
                
                
                self.appStore.removeUserData()
                if result {
                    self.navigateToSignIn()
                }else{
                      self.showToast(message: "Something went wrong", font: .systemFont(ofSize: 12.0))
                }
                
               
            }))
            
            self.present(alert, animated: true, completion: nil)
            
           }))
           
//           alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
//
//           }))

           
           

           self.present(alert, animated: true, completion: {
//               print("completion block")
           })
    }
    @objc
       func addParkingBtnClicked() {
            print("add parking button clicked")
            let addParkingViewController = self.storyboard?.instantiateViewController(identifier: "add_parking") as! AddParkingViewController
            
            self.navigationController?.pushViewController(addParkingViewController, animated: true)
       }
    
    @IBOutlet weak var parkingTableView: UITableView!
    
    

}

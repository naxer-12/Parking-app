//
//  AddParkingViewController.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-22.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class AddParkingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK : Outlets
    
    @IBOutlet weak var txtBuildingCode: UITextField!
    @IBOutlet weak var txtCarLicensePlate: UITextField!
    @IBOutlet weak var txtSuitNoOfHost: UITextField!
    @IBOutlet weak var parkingLocationSwitch: UISwitch!
    @IBOutlet weak var txtStreetName: UITextField!
    @IBOutlet weak var hoursToParkPicker: UIPickerView!
    
    
    //MARK : Variables
    var hoursToParkData:[String] = [String]()
    
    //MARK : Functions
    @IBAction func cancelBtnPressed(_ sender: Any) {
        txtBuildingCode.text = ""
        txtCarLicensePlate.text = ""
        txtSuitNoOfHost.text = ""
        txtStreetName.text = ""
        parkingLocationSwitch.isOn = false
    }
    
    
    @IBAction func parkBtnPressed(_ sender: Any) {
        print("park button clicked")
        
        let parkingListViewController = self.storyboard?.instantiateViewController(identifier: "parking_list") as! ParkingTableViewController
        
        self.navigationController?.pushViewController(parkingListViewController, animated: true)
    }
    
    //Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hoursToParkData.count
    }
    
    //The data to return for the row and component that's being passed
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
        return hoursToParkData[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Park your car"
        // Do any additional setup after loading the view.
        
        // connecting data to picker view
        self.hoursToParkPicker.delegate = self
        self.hoursToParkPicker.dataSource = self
        
        // input the data into the array
        hoursToParkData = ["1-hour or less", "4-hours", "12-hours", "24-hours"]
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

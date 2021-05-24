//
//  AddParkingViewController.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-22.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit
import CoreLocation
import Combine

struct Location{
    var locationName : String
    var coordinates : CLLocationCoordinate2D
}

class AddParkingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var cancellables : Set<AnyCancellable> = []
    let locationManager = CLLocationManager()
    let appStore: AppStore = AppStore();
   
    var currentLat: Double?, currentLong: Double?, streetAddress: String?
    //MARK : Outlets
    
    @IBOutlet weak var txtBuildingCode: UITextField!
    @IBOutlet weak var txtCarLicensePlate: UITextField!
    @IBOutlet weak var txtSuitNoOfHost: UITextField!
    @IBOutlet weak var parkingLocationSwitch: UISwitch!
    @IBOutlet weak var txtStreetName: UITextField!
    @IBOutlet weak var hoursToParkPicker: UIPickerView!
    @IBOutlet weak var lblBuildingCodeError: UILabel!
    @IBOutlet weak var lblSuitNoOfHostError: UILabel!
    @IBOutlet weak var lblStreetNameError: UILabel!
    @IBOutlet weak var lblCarPlateNoError: UILabel!
    
    private let parkingRepo:ParkingRepo = ParkingRepo()
    private let geocoder = CLGeocoder()
    
    //MARK : Variables
    var hoursToParkData:[String] = [String]()
    var selectedHours: String = ""
    var validateBuildingCode : Bool = false
    var validateSuitNoOfHost : Bool = false
    var validateCarPlateNo : Bool = false
    
    
    //MARK : Functions
    @IBAction func cancelBtnPressed(_ sender: Any) {
        hoursToParkPicker.selectRow(0, inComponent: 0, animated: true)
        txtBuildingCode.text = ""
        txtSuitNoOfHost.text = ""
        txtStreetName.text = ""
        parkingLocationSwitch.isOn = false
    }
    
    
    @IBAction func parkingLocationSwitchToggled(_ sender: Any) {
            txtStreetName.isHidden = parkingLocationSwitch.isOn
    }
    
    @IBAction func parkBtnPressed(_ sender: Any) {
        print("park button clicked")
        var isError : Bool = false
        lblBuildingCodeError.text = ""
        lblCarPlateNoError.text = ""
        lblSuitNoOfHostError.text = ""
        lblStreetNameError.text = ""
        validateBuildingCode = Validation.validateBuildingCode(buildingCode: txtBuildingCode.text!)
        
        if (!validateBuildingCode){
            lblBuildingCodeError.isHidden = false
                       lblBuildingCodeError.text = "Invalid field! Please enter exactly 5 alphanumeric characters. "
                       lblBuildingCodeError.textColor = .red
            isError = true
        }
        
        validateSuitNoOfHost = Validation.validateSuitNoOfHost(suitNoOfHost: txtSuitNoOfHost.text!)
        
        if(!validateSuitNoOfHost){
            lblSuitNoOfHostError.isHidden = false
            lblSuitNoOfHostError.text = "Invalid field! Please enter minimum 2 and maximum 5 alphanumeric characters"
            lblSuitNoOfHostError.textColor = .red
            isError = true
        }
        
        validateCarPlateNo = Validation.validateCarLicensePlate(carLicenseNo: txtCarLicensePlate.text!)
        
        if(!validateCarPlateNo){
            lblCarPlateNoError.isHidden = false
            lblCarPlateNoError.text = "Invalid field! Please edit car plate number to be minimum 2 and maximum 8 alphanumeric characters"
            lblCarPlateNoError.textColor = .red
            isError = true
        }
        
        if(!parkingLocationSwitch.isOn){
            guard !txtStreetName.text!.isEmpty else{
                lblStreetNameError.isHidden = false
                lblStreetNameError.text = "Please enter street address"
                lblStreetNameError.textColor = .red
                isError = true
                return
            }
            
        }
        

        if(!isError){
            
            
            if (parkingLocationSwitch.isOn) {
                self.locationManager.requestWhenInUseAuthorization()
                self.locationManager.requestAlwaysAuthorization()
                
                if CLLocationManager.locationServicesEnabled(){
                    
                    print(#function, "Location access granted")
                    
                    self.locationManager.delegate = self
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                    self.locationManager.startUpdatingLocation()
                    
                } else {
                    print(#function, "Location access denied")
                }
            } else{
                guard let street = txtStreetName.text else {return}
                streetAddress = street
                self.getLocation(address: street)
            }
        }
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHours = hoursToParkData[row]
        print(#function, selectedHours)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Park your car"
        // Do any additional setup after loading the view.
        
        // connecting data to picker view
        self.hoursToParkPicker.delegate = self
        self.hoursToParkPicker.dataSource = self
        
        self.txtCarLicensePlate.text = appStore.getCarPlateNo()
        
        // input the data into the array
        hoursToParkData = ["1-hour or less", "4-hours", "12-hours", "24-hours"]
        
        self.parkingLocationSwitch.isOn = false
        self.lblBuildingCodeError.isHidden = true
        self.lblSuitNoOfHostError.isHidden = true
        self.lblStreetNameError.isHidden = true
        self.lblCarPlateNoError.isHidden = true
    }
}

extension AddParkingViewController : CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Fetching device location
        guard let currentLocation : CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        currentLong = currentLocation.longitude
        currentLat = currentLocation.latitude
        print(#function, "Current location : lat \(currentLocation.latitude) lng \(currentLocation.longitude)")
        self.getAddress(location: CLLocation(latitude: currentLocation.latitude, longitude:currentLocation.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function, "Unable to get location \(error)")
    }
    
    func getAddress(location: CLLocation){
           self.geocoder.reverseGeocodeLocation(location, completionHandler: {(placemark, error) in
               self.processGeoResponse(placemarkList: placemark, error: error)
           })
    }
    
    func processGeoResponse(placemarkList : [CLPlacemark]?, error: Error?){
        if error != nil{
            self.txtStreetName.text = "No City Found"
        } else {
            if let placemarks = placemarkList, let placemark = placemarks.first{
                let city = placemark.locality ?? "NA"// represent city, if coordinates represent ocean it will not provide
                let province = placemark.administrativeArea ?? "NA"
                let country = placemark.country ?? "NA"
                let street = placemark.thoroughfare ?? "NA"
                self.streetAddress = "\(street), \(city), \(province), \(country)"
                addParking()
            }else{
                self.streetAddress = "Address not found!"
            }
        }
    }
    
    private func getLocation(address : String){
        self.geocoder.geocodeAddressString(address, completionHandler: {(placemark, error) in
            self.processForwardGeoResponse(placemarks: placemark, error: error)
        })
    }
    
    private func processForwardGeoResponse(placemarks: [CLPlacemark]?, error: Error?){
        if error != nil{
            
            currentLat = 0
            currentLong = 0
            lblStreetNameError.isHidden = false
            lblStreetNameError.text = "Invalid street address"
        } else{
            var obtainedLocation : CLLocation?
            
            if let placemark = placemarks, placemarks!.count > 0{
                obtainedLocation = placemark.first?.location
            }
            
            if obtainedLocation != nil{
                currentLat = obtainedLocation!.coordinate.latitude
                currentLong = obtainedLocation!.coordinate.longitude
                addParking()
            }else {
                currentLat = 0
                currentLong = 0
                lblStreetNameError.isHidden = false
                lblStreetNameError.text = "Invalid street address"
            }
        }
    }
}

extension AddParkingViewController {
    func addParking() {
        let parkingModel: ParkingModel = ParkingModel(buildingCode: txtBuildingCode.text, carPlateNo: txtCarLicensePlate.text, dateTimeOfParking: Date(), parkingHours: selectedHours, parkingId: UUID(), parkingLat: currentLat, parkingLng: currentLong, parkingStreetAddress: streetAddress, suitNoOfHost: txtSuitNoOfHost.text)
        parkingRepo.createRecord(record: parkingModel)
        
        let parkingListViewController = self.storyboard?.instantiateViewController(identifier: "parking_list") as! ParkingTableViewController
               
               self.navigationController?.pushViewController(parkingListViewController, animated: true)
               print(#function, "Added parking")
        
    }
}

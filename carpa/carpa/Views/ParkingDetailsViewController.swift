//
//  ParkingDetailsViewController.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-25.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct CurrentLocation{
    var locationName : String
    var coordinates : CLLocationCoordinate2D
}

class ParkingDetailsViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var parkingData: ParkingModel?
    
    @IBOutlet weak var lblBuildingCode: UILabel!
    @IBOutlet weak var lblParkingHours: UILabel!
    @IBOutlet weak var lblCarPlateNo: UILabel!
    @IBOutlet weak var lblSuitNoOfHost: UILabel!
    @IBOutlet weak var lblStreetAddress: UILabel!
    @IBOutlet weak var lblDateAndTime: UILabel!
    @IBOutlet weak var lblMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Parking Details"
        lblBuildingCode.text = parkingData?.buildingCode
        lblParkingHours.text = parkingData?.parkingHours
        lblCarPlateNo.text = parkingData?.carPlateNo
        lblSuitNoOfHost.text = parkingData?.suitNoOfHost
        lblStreetAddress.text = parkingData?.parkingStreetAddress
        lblDateAndTime.text = "\(parkingData?.dateTimeOfParking ?? Date())"
        
        
        
        
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        
        lblMapView.delegate = self
        if CLLocationManager.locationServicesEnabled(){
                    
            print(#function, "Location access granted")
            
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        } else {
            print(#function, "Location access denied")
        }
    }
}

extension ParkingDetailsViewController: CLLocationManagerDelegate, MKMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            // fetch the device location
            guard let currentLocation : CLLocationCoordinate2D = manager.location?.coordinate else {
                return
            }
            print(#function, "Current location : lat \(currentLocation.latitude) lng \(currentLocation.longitude)")
            
            self.displayLocationOnMap(currentLocation: currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(#function, "Unable to get location \(error)")
    }
    
    func displayLocationOnMap(currentLocation : CLLocationCoordinate2D){
        let sourceCordinate = currentLocation
        
       
        
        let destinationCordinate = CLLocationCoordinate2D(latitude: (parkingData?.parkingLat)!, longitude: (parkingData?.parkingLng)!)
        print("Destination \(destinationCordinate)" )
        let destPlaceMark = MKPlacemark(coordinate: destinationCordinate)
        let sourcePlaceMark = MKPlacemark(coordinate: sourceCordinate)
        print("Current \(sourceCordinate)")
//        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        let region = MKCoordinateRegion(center: sourceCordinate, span: span)
        
        
        let sourceItem = MKMapItem(placemark: sourcePlaceMark)
        let destItem = MKMapItem(placemark: destPlaceMark)
        
        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: destinationRequest)
        directions.calculate { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Something is wrong \(error)")
                }
                return
            }
            let route = response.routes[0]
            self.lblMapView.addOverlay(route.polyline)
            self.lblMapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
        
//        self.lblMapView?.setRegion(region, animated: true)
        

        //display annotation -> pin
        let currentAnnotation = MKPointAnnotation()
        currentAnnotation.coordinate = sourceCordinate
        currentAnnotation.title = "You're here"
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destinationCordinate
        destinationAnnotation.title = "Your car"
        
        
        self.lblMapView?.addAnnotations([currentAnnotation, destinationAnnotation])
        
        


    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render
    }
}



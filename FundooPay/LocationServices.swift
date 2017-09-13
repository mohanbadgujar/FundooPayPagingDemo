//
//  LocationServices.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 9/5/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

//let city = ""
//var Street = ""
//var SubLocality = ""

typealias JSONDictionary = [String:Any]

class LocationServices {
    
    static let shared = LocationServices()
    let locManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    let authStatus = CLLocationManager.authorizationStatus()
    let inUse = CLAuthorizationStatus.authorizedWhenInUse
    let always = CLAuthorizationStatus.authorizedAlways
    
    var locationData:[String:Any] = [String:Any]()
    
    func getAdress(completion: @escaping (_ address: JSONDictionary?, _ error: Error?) -> ()) {
        
        self.locManager.requestWhenInUseAuthorization()
        
        if self.authStatus == inUse || self.authStatus == always {
        
        self.currentLocation = locManager.location
            
            if currentLocation != nil{
            
            print("Current location",currentLocation!)
            
            let geoCoder = CLGeocoder()
            
            geoCoder.reverseGeocodeLocation(self.currentLocation!) { placemarks, error in
                
                if let e = error {
                    
                    completion(nil, e)
                    
                } else {
                    let placeArray = placemarks
                    
                    var placeMark: CLPlacemark!
                    
                    placeMark = placeArray?[0]
                    
                    guard let address = placeMark.addressDictionary as? JSONDictionary else {
                        return
                    }
                    
                    completion(address, nil)
                }
            }
        }else{
            self.getAdress { address, error in
                
                if let a = address, let city = a["City"], let Street1 = a["Street"], let SubLocality1 = a["SubLocality"]  as? String {
                   
                    print("city===",city)
                   
                    if !a.isEmpty{
                        
                         print("address=++++igkjhkj==",a)
                    
                    self.locationData.updateValue(Street1, forKey: "Street")
                    self.locationData.updateValue(SubLocality1, forKey: "SubLocality")
   
                    // post a notification
                     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: self.locationData)
                    }
          
                }
            }
        }
     }
  }
}



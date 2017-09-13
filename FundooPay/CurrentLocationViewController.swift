//
//  CurrentLocationViewController.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 9/5/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var setLocationTitleLbl: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var placeInShort: UILabel!
    
    @IBOutlet weak var nextVC: UIButton!
    
    @IBOutlet weak var nearPlace: UILabel!
    
    let manager = CLLocationManager()

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake( myLocation, span)
        mapView.setRegion(region, animated:true)
        
        self.mapView.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register to receive notification in your class
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        LocationServices.shared.getAdress { address, error in
            
            if let a = address, let city = a["City"], let Street1 = a["Street"], let SubLocality1 = a["SubLocality"]  as? String {
                print("address===",a)
                print("city===",city)
                
                if !a.isEmpty{
                
                    let Street = Street1 as! String
                    let SubLocality = SubLocality1
                    print("Street===",Street)
                    print("SubLocality===",SubLocality)
                    self.place.text = Street
                    self.nearPlace.text = SubLocality
                    self.placeInShort.text = Street
                }
            }
         }
      }
    
    
    // handle notification
    func showSpinningWheel(_ notification: NSNotification) {
        print("+++++++++++++++++++",notification.userInfo ?? "")
        if let dict = notification.userInfo as NSDictionary? {
            if let Street = dict["Street"] as? String{
                self.place.text = Street
                print("place=======+",place)
            }
            
            if let SubLocality = dict["SubLocality"] as? String{
                self.nearPlace.text = SubLocality
            }
            
            if let Street = dict["Street"] as? String{
                self.placeInShort.text = Street
            }
        }
    }
    
    @IBAction func nextVC(_ sender: UIButton) {
        
        let bounds = self.nextVC.bounds
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .transitionCrossDissolve, animations: {
            self.nextVC.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            
            //write any task u want to perform
            
        }, completion: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrentLocationViewController2") as! CurrentLocationViewController2
        self.present(vc, animated: false, completion: nil)
    }
    @IBAction func backBtn(_ sender: UIButton) {
        
         self.dismiss(animated: true, completion: nil)
    }
}



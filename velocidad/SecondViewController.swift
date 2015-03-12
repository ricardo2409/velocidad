//
//  SecondViewController.swift
//  velocidad
//
//  Created by Ricardo Trevino on 3/4/15.
//  Copyright (c) 2015 Ricardo Trevino. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMobileAds

class SecondViewController: UIViewController, CLLocationManagerDelegate, UIApplicationDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var postalLabel: UILabel!
    @IBOutlet weak var localityLabel: UILabel!
    @IBOutlet weak var sublocalityLabel: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    var auxlatitude = ""
    var auxlongitude = ""
    
    @IBOutlet weak var BannerView2: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Ads Google
        self.BannerView2.adUnitID = "ca-app-pub-1712455002260869/3408924030"
        self.BannerView2.rootViewController = self
        var request: GADRequest = GADRequest()
        request.testDevices = ["c7fca2dcdca2a46cf8e3531f6a6c1d4d"]
        self.BannerView2.loadRequest(request)
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
       
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
     
                
                let pm = placemarks[0] as CLPlacemark
                
                self.nameLabel.text! = pm.name
                self.countryLabel.text! = pm.country
                self.postalLabel.text! = pm.postalCode
                self.localityLabel.text! = pm.locality
                self.sublocalityLabel.text! = pm.subLocality
    
            
        })
        
        let location = locations.last as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

        latitude.text = "\(center.latitude)"
        longitude.text = "\(center.longitude)"
    }
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        

}

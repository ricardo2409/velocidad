//
//  ViewController.swift
//  velocidad
//
//  Created by Ricardo Trevino on 3/2/15.
//  Copyright (c) 2015 Ricardo Trevino. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMobileAds

class ViewController: UIViewController, CLLocationManagerDelegate, UIApplicationDelegate {
    

    let locationManager = CLLocationManager()
    @IBOutlet weak var speedValue: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var BannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BannerView.adUnitID = "ca-app-pub-1712455002260869/3408924030"
        self.BannerView.rootViewController = self
        var request: GADRequest = GADRequest()
        //request.testDevices = ["c7fca2dcdca2a46cf8e3531f6a6c1d4d"]
        self.BannerView.loadRequest(request)
        
        if (CLLocationManager.locationServicesEnabled())
        {
            //println("ifenabled")

            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
        }
        map.showsUserLocation = true
    }
    
    
    var point: MKPointAnnotation! = MKPointAnnotation()
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        //println("didupdatelocation")
        self.map.removeAnnotation(point)
        
        var velocidad:CLLocationSpeed = (3.6 * manager.location!.speed)
        if (velocidad >= 0) {
            speedValue.text = "\(lround(velocidad)) km/h"
        }
        
       let location = locations.last as CLLocation
      
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        self.map.setRegion(region, animated: false)
        
        point = MKPointAnnotation()
        point.coordinate = location.coordinate
        point.title = "Ricardo's iPhone"
        point.subtitle = "Aquí"
        //lat.text = "\(center.latitude)"
        //long.text = "\(center.longitude)"


        
        //self.map.addAnnotation(point)
    
        
        //salva batería
        //locationManager.stopUpdatingLocation()
        
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using
//       
//        
//        
//        let destinationVC = segue.destinationViewController as SecondViewController
//        destinationVC.auxlatitude = lat.text!
//        destinationVC.auxlongitude = long.text!
//
//     
//        
//        // Pass the selected object to the new view controller.
//    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


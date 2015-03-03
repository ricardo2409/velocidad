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

class ViewController: UIViewController, CLLocationManagerDelegate {
    

    let locationManager = CLLocationManager()
    @IBOutlet weak var speedValue: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
        }
      
        
        
        
    }
    var point: MKPointAnnotation! = MKPointAnnotation()


    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.map.removeAnnotation(point)
        
        var velocidad:CLLocationSpeed = (3.6 * manager.location!.speed)
        speedValue.text = "\(lround(velocidad))"
        
        let location = locations.last as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
        point = MKPointAnnotation()

        point.coordinate = location.coordinate
        point.title = "Ricardo's iPhone"
        point.subtitle = "Aquí"
        
        
        self.map.addAnnotation(point)
        
        //save battery life
        locationManager.stopUpdatingLocation()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Kavya Muppidi on 18/10/19.
//  Copyright © 2019 Kavya Muppidi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBAction func saveButtonAction(_ sender: Any) {
    }
    
    @IBAction func getCurrentLocationAction(_ sender: Any) {
    }
    @IBOutlet weak var locationLabel: UILabel!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func getDateString() -> String {
        let date = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        let dateStr = dateFormat.string(from: date)
        return dateStr
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude), \(locValue.longitude)")
        let timeStamp = TimeStamp()
        timeStamp.name = "locations = \(locValue.latitude) \(locValue.longitude)"
        locationLabel.text = timeStamp.name
        timeStamp.entryTime = getDateString()
        DataManager.shared.saveTimeStampData(timeStamp: timeStamp)
    }
}

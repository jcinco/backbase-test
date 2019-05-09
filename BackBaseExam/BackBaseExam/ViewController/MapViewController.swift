//
//  MapViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit
import MapKit

public class MapViewController:UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let city = CitiesViewModel.sharedInstance.selectedCity
        self.setMap(toCity: city)
        
        // Listen to changes on selected city in the view model
        NotificationCenter.default.addObserver(self, selector: #selector(citySelected(notification:)), name: Notification.Name("citySelected"), object: nil)
    }
    
    @objc func citySelected(notification:Notification) {
        let city = CitiesViewModel.sharedInstance.selectedCity
        self.setMap(toCity: city)
    }
    
    
    
    func setMap(toCity inCity:City?) {
        guard let city = inCity else {
            print("No city was selected")
            return
        }
        
        if (nil != MapViewModel.sharedInstance.currentAnnotation) {
            self.mapView.removeAnnotation(MapViewModel.sharedInstance.currentAnnotation!)
        }
        
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: city.coord?.lat ?? 0) ?? 0,
                                                       longitude: CLLocationDegrees(exactly: city.coord?.lon ?? 0) ?? 0)
        self.mapView.addAnnotation(annotation)
        self.mapView.setCenter(annotation.coordinate, animated: true)
        
        MapViewModel.sharedInstance.currentAnnotation = annotation
    }
}

//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Christian Perrone on 05/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        //Create the map view
        mapView = MKMapView()
        
        //Set it to be the view of the view controller
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }

}

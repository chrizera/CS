//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Christian Perrone on 05/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var button: UIButton!
    
    override func loadView() {
        //Create the map view
        mapView = MKMapView()
        
        //Set it to be the view of the view controller
        view = mapView
        
        //let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(segControl:))/* Selector(("mapTypeChanged:"))*/, for: .valueChanged)
        
        let frame = CGRect(x: 320, y: 540, width: 50, height: 50)
        button = UIButton(frame: frame)
        button.backgroundColor = UIColor.red
        button.setTitle("Zoom", for: .normal)
        button.addTarget(self, action: #selector(zoom(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        
        mapView.userTrackingMode = .followWithHeading
    }

    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }

    @IBAction func zoom(sender: AnyObject) {
        var region = self.mapView.region
        region.span.latitudeDelta /= 2
        region.span.longitudeDelta /= 2
    }
}

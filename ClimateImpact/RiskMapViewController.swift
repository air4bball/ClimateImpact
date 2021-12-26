//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit
import MapKit
import CoreLocation

class RiskMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
        
    @IBOutlet weak var riskMap: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var location = CLLocation(latitude: 46.7667 as CLLocationDegrees, longitude: 23.58 as CLLocationDegrees)
        
        var riskIndex = [[5.3, 4, 4], [0, 2, 6], [2, 2, 6], [7.4, 0, 6], [3.8, 2, 4], [0, 1, 8], [4.4, 4, 4], [0, 0, 4], [5.5, 2, 4], [6.9, 2, 4], [0.4, 0, 6], [4.2, 0, 4], [0, 1, 2], [1.8, 0, 4], [6.7, 0, 2], [0, 2, 2,], [6.1, 1, 6], [5.4, 0, 4], [6.2, 0, 4], [5.4, 2, 6], [0, 1, 8], [5.3, 3, 4], [4.6, 0, 4], [2.7, 4, 6], [4.9, 0, 6], [1.2, 2, 4], [6.1, 2, 4], [4.2, 2, 6], [3.1, 0, 4], [1.2, 0, 4], [2.9, 1, 4], [1.5, 0, 6], [10, 1, 4], [1.5, 3, 6], [3.4, 3, 4], [5.4, 0, 4], [8.4, 0, 4], [0, 4, 4,], [0.4, 4, 6], [7.3, 1, 4], [0, 3, 6], [4.7, 0, 4], [5.6, 4, 4], [0, 3, 4], [7.3, 0, 6], [0, 0, 6], [6.9, 0, 6], [3.3, 4, 4], [3.1, 2, 6], [2, 4, 4], [0, 2, 8], [6.5, 0, 6], [3.6, 0, 6], [5.3, 0, 4], [3.6, 2, 2], [4.8, 0, 4], [1.8, 2, 6], [2.3, 0, 4]]
        
        var avgIndexEachCountyOrdered = [Double]()
        for i in 0..<riskIndex.count {
            var countyTotal = 0.0
            for j in 0..<3 {
                countyTotal += riskIndex[i][j]
            }
            avgIndexEachCountyOrdered.append(countyTotal / 3.0)
        }
        let avgIndexAscendingEachCounty = avgIndexEachCountyOrdered.sorted()
        let index1 = avgIndexAscendingEachCounty[57]
        let index2 = avgIndexAscendingEachCounty[56]
        let index3 = avgIndexAscendingEachCounty[55]
        let index4 = avgIndexAscendingEachCounty[54]
        let index5 = avgIndexAscendingEachCounty[53]
        
        
        
        
        //Riverside
        self.addRadiusCircle(location: CLLocation(latitude: -115, longitude: 35), radius: Int(index1))
        //Santa Clara
        self.addRadiusCircle(location: CLLocation(latitude: -121, longitude: 36), radius: Int(index2))
        //Butte
        self.addRadiusCircle(location: CLLocation(latitude: -121, longitude: 40), radius: Int(index3))
        //Alameda
        self.addRadiusCircle(location: CLLocation(latitude: -121, longitude: 37), radius: Int(index4))
    }

    func addRadiusCircle(location: CLLocation, radius: Int){
        self.riskMap.delegate = self
        let circle = MKCircle(center: location.coordinate, radius: CLLocationDistance(radius))
        self.riskMap.addOverlay(circle)
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.red
            circle.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
            circle.lineWidth = 1
            return circle
        } else {
            return MKPolylineRenderer()
        }
    }
    


}


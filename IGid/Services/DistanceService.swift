//
//  DistanceService.swift
//  IGid
//
//  Created by Рамазан on 03.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation
import MapKit

protocol DistanceService {
    func caculateDistance(coordinate: Location, completion: @escaping (Result<String, Error>) -> Void)
}

final class DistanceServiceImp: DistanceService {
    
    private var locationManager: CLLocationManager {
        let locMan = CLLocationManager()
        locMan.startUpdatingLocation()
        return locMan
    }

    func caculateDistance(coordinate: Location, completion: @escaping (Result<String, Error>) -> Void) {
        guard let myCoordinate = locationManager.location?.coordinate else { return }
        let startPoint = MKPlacemark(coordinate: myCoordinate)
        let endPoint = MKPlacemark(coordinate:
            CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinate.latitude),
                                   longitude: CLLocationDegrees(coordinate.longitude)))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startPoint)
        request.destination = MKMapItem(placemark: endPoint)
        request.transportType = .automobile
        
        let diraction = MKDirections(request: request)
        
        diraction.calculate { (response, error) in
            
            guard let response = response else {
                return
            }
            
            for route in response.routes {
                completion(.success(route.distance.binade.toDistanceFormat()))
            }
            
        }
    }
    
}

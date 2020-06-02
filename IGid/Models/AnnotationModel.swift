//
//  AnnotationModel.swift
//  IGid
//
//  Created by Рамазан on 02.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import MapKit

final class AnnotationModel: NSObject, MKAnnotation {
    
    private var myCoordinate: Location
    private var myTitle: String

    init(myCoordinate: Location, title: String) {
        self.myCoordinate = myCoordinate
        self.myTitle = title
    }

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(myCoordinate.latitude),
                                      longitude: CLLocationDegrees(myCoordinate.longitude))
    }
    
    var title: String? {
        return myTitle
    }
}

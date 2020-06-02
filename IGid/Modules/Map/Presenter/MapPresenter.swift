//
//  MapPresenter.swift
//  IGid
//
//  Created by Рамазан on 02.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

protocol MapViewOutput: ViewOutput {
    func locationServiceDisabled()
}

final class MapPresenter {
    
    weak var view: MapViewInput?
    
}

extension MapPresenter: MapViewOutput {
    func viewIsReady() {
        view?.showLocation(location: Location(longitude: -122.406467, latitude: 37.789834 ), name: "QWER")
    }
    
    func locationServiceDisabled() {
        
    }
    
}

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
    
    // MARK: - Dependency
    
    weak var view: MapViewInput?

    
    // MARK: - Private properties
    
    private let place: PlaceModel
    
    
    // MARK: - Init
    
    init(place: PlaceModel) {
        self.place = place
    }
        
}

extension MapPresenter: MapViewOutput {
    func viewIsReady() {
        view?.showLocation(location: place.location, name: place.name)
    }
    
    func locationServiceDisabled() {
        
    }
    
}

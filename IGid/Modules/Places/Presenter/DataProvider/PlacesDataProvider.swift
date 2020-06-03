//
//  PlacesDataProvider.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol PlacesDataProviderInput {
    func createViewModel(_ data: [PlaceModel]) -> PlacesViewModel
}


final class PlacesDataProvider: PlacesDataProviderInput {
    
    // MARK: - Typealiases
    
    typealias placeCellConfigurator = TableCellConfigurator<PlaceCell, PlaceCell.Model>
    
    
    // MARK: - Private props
    
    private let distanceService: DistanceService
    
    
    // MARK: - Init
    
    init(distanceService: DistanceService) {
        self.distanceService = distanceService
    }

    
    // MARK: - PlacesDataProviderInput
    
    func createViewModel(_ data: [PlaceModel]) -> PlacesViewModel {

        
        var rows: [PlacesViewModel.Row] = []
        
        for place in data {
            rows.append(.place(configurator: placeCellConfigurator(item: PlaceCell.Model(backgroundImage: nil, name: place.name, location: place.location, distanceService: distanceService))))
        }

        return PlacesViewModel(rows: rows)
    }
}

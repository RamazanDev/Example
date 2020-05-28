//
//  PlacesDataProvider.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol PlacesDataProviderInput {
    func createViewModel() -> PlacesViewModel
}


final class PlacesDataProvider: PlacesDataProviderInput {
    
    // MARK: - Typealiases
    
    typealias placeCellConfigurator = TableCellConfigurator<PlaceCell, PlaceCell.Model>
    
    // MARK: - PlacesDataProviderInput
    
    func createViewModel() -> PlacesViewModel {

        
        var rows: [PlacesViewModel.Row] = []
        
        rows.append(.place(configurator: placeCellConfigurator(item: PlaceCell.Model(backgroundImage: nil, name: "a", distance: 2))))
        rows.append(.place(configurator: placeCellConfigurator(item: PlaceCell.Model(backgroundImage: nil, name: "a", distance: 2))))
        rows.append(.place(configurator: placeCellConfigurator(item: PlaceCell.Model(backgroundImage: nil, name: "a", distance: 2))))
        rows.append(.place(configurator: placeCellConfigurator(item: PlaceCell.Model(backgroundImage: nil, name: "a", distance: 2))))
        rows.append(.place(configurator: placeCellConfigurator(item: PlaceCell.Model(backgroundImage: nil, name: "a", distance: 2))))

        return PlacesViewModel(rows: rows)
    }
}

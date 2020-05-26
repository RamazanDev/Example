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
    
    // MARK: - PlacesDataProviderInput
    
    func createViewModel() -> PlacesViewModel {

        
        var rows: [PlacesViewModel.Row] = []

        
        return PlacesViewModel(rows: rows)
    }
}

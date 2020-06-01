//
//  PlaceCardDataProvider.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import UIKit

protocol PlaceCardDataProviderInput {
    func createViewModel() -> PlaceCardViewModel
}


final class PlaceCardDataProvider: PlaceCardDataProviderInput {
    
    // MARK: - Typealiases
    
    // MARK: - PlaceCardDataProviderInput
    
    func createViewModel() -> PlaceCardViewModel {

        
        var rows: [PlaceCardViewModel.Row] = []

        
        return PlaceCardViewModel(rows: rows)
    }
}

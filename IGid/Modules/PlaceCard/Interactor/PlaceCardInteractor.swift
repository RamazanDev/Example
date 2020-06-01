//
//  PlaceCardInteractor.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//


protocol PlaceCardInteractorInput {
}


final class PlaceCardInteractor {
    
    // MARK: - Properties
    
    weak var presenter: PlaceCardInteractorOutput?
    
    
    
    // MARK: - Init
    
    init() {
    }
    
    
}


// MARK: - PlaceCardInteractorInput
extension PlaceCardInteractor: PlaceCardInteractorInput {
    
}

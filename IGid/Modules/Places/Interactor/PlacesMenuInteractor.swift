//
//  PlacesInteractor.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//


protocol PlacesInteractorInput {
}


final class PlacesInteractor {
    
    // MARK: - Properties
    
    weak var presenter: PlacesInteractorOutput?
    
    // MARK: - Init
    
    init() {
    }
    
    
}


// MARK: - PlacesInteractorInput
extension PlacesInteractor: PlacesInteractorInput {
    
    func obtainAccountInfo() {

    }
}

//
//  PlacesInteractor.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//


protocol PlacesInteractorInput {
    func getPlaces()
}


final class PlacesInteractor {
    
    // MARK: - Properties
    
    weak var presenter: PlacesInteractorOutput?
    
    private let placesService: PlacesService
    
    // MARK: - Init
    
    init(placesService: PlacesService) {
        self.placesService = placesService
    }
    
    
}


// MARK: - PlacesInteractorInput
extension PlacesInteractor: PlacesInteractorInput {
    
    func getPlaces() {
        placesService.getAllPlaces { [weak self] (result) in
            switch result {
            case .success(let places):
                self?.presenter?.successLoadedPlaces(places)
            case .failure(let error):
                dump(error)
            }
        }
    }
}

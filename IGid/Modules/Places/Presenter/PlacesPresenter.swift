//
//  PlacesPresenter.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

protocol PlacesViewOutput: ViewOutput {
    func didSelectCell(at indexPath: IndexPath)
}

protocol PlacesInteractorOutput: class {
    
    func successLoadedPlaces(_ places: [PlaceModel])
    
}


final class PlacesPresenter {
    
    // MARK: - Dependency
    
    private let dataProvider: PlacesDataProviderInput
    weak var view: PlacesViewInput?
    var interactor: PlacesInteractorInput?
    var router: PlacesRouterInput?
    
    // MARK: - Properties
    
    private var places: [PlaceModel]!

    
    
    // MARK: - Init
    
    init(dataProvider: PlacesDataProviderInput) {
        self.dataProvider = dataProvider
    }
}


// MARK: - PlacesViewOutput
extension PlacesPresenter: PlacesViewOutput {
    
    // MARK: - BaseViewOutput
    
    func viewIsReady() {
        
        view?.showLoading()
        
        interactor?.getPlaces()
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        router?.openPlaceCardModule(model: places[indexPath.row])
    }
    
}


// MARK: - PlacesInteractorOutput
extension PlacesPresenter: PlacesInteractorOutput {
    func successLoadedPlaces(_ places: [PlaceModel]) {
        view?.hideLoading()
        self.places = places
        let viewModel = dataProvider.createViewModel(places)
        view?.update(with: viewModel)
    }
    
    
    
}

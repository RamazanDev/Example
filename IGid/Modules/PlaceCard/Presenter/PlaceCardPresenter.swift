//
//  PlaceCardPresenter.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import Foundation

protocol PlaceCardViewOutput: ViewOutput {
    func closeButtonCLick()
    func roadButtonClick()
}

protocol PlaceCardInteractorOutput: class {

}


final class PlaceCardPresenter {
    
    // MARK: - Dependency
    
    weak var view: PlaceCardViewInput?
    
    var interactor: PlaceCardInteractorInput?
    var router: PlaceCardRouterInput?
    
    
    // MARK: - Private properties
    
    private let place: PlaceModel
    
    
    // MARK: - Init
    
    init(place: PlaceModel) {
        self.place = place
    }
    
}


// MARK: - PlaceCardViewOutput
extension PlaceCardPresenter: PlaceCardViewOutput {
   
    // MARK: - BaseViewOutput
    
    func viewIsReady() {
        view?.update(place: place)
    }
    
    func closeButtonCLick() {
        router?.close()
    }
    
    func roadButtonClick() {
        router?.openMapModule(place: self.place)
    }
    
}


// MARK: - PlaceCardInteractorOutput
extension PlaceCardPresenter: PlaceCardInteractorOutput {
  
}

// MARK: - PlaceCardSLiderDataSourceOutput
extension PlaceCardPresenter: PlaceCardSLiderDataSourceOutput {
    
}

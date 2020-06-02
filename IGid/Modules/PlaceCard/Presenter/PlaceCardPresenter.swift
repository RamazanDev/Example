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
    
    // MARK: - Properties
    
    weak var view: PlaceCardViewInput?
    
    var interactor: PlaceCardInteractorInput?
    var router: PlaceCardRouterInput?
    
}


// MARK: - PlaceCardViewOutput
extension PlaceCardPresenter: PlaceCardViewOutput {
   
    // MARK: - BaseViewOutput
    
    func viewIsReady() {
        view?.update(with: PlaceCardViewModel(rows: []))
    }
    
    func closeButtonCLick() {
        router?.close()
    }
    
    func roadButtonClick() {
        router?.openMapModule()
    }
    
}


// MARK: - PlaceCardInteractorOutput
extension PlaceCardPresenter: PlaceCardInteractorOutput {
  
}

// MARK: - PlaceCardSLiderDataSourceOutput
extension PlaceCardPresenter: PlaceCardSLiderDataSourceOutput {
    
}

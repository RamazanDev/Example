//
//  PlaceCardPresenter.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import Foundation

protocol PlaceCardViewOutput: ViewOutput {
    func didSelectCell(at indexPath: IndexPath)
}

protocol PlaceCardInteractorOutput: class {

}


final class PlaceCardPresenter {
    
    // MARK: - Properties
    
    weak var view: PlaceCardViewInput?
    
    var interactor: PlaceCardInteractorInput?
    var router: PlaceCardRouterInput?
    
    private let dataProvider: PlaceCardDataProviderInput
    
    
    // MARK: - Init
    
    init(dataProvider: PlaceCardDataProviderInput) {
        self.dataProvider = dataProvider
    }
}


// MARK: - PlaceCardViewOutput
extension PlaceCardPresenter: PlaceCardViewOutput {
   
    // MARK: - BaseViewOutput
    
    func viewIsReady() {
        view?.showLoading()
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        
    }
    
}


// MARK: - PlaceCardInteractorOutput
extension PlaceCardPresenter: PlaceCardInteractorOutput {
  
}

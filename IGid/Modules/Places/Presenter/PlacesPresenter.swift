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

}


final class PlacesPresenter {
    
    // MARK: - Properties
    
    weak var view: PlacesViewInput?
    
    var interactor: PlacesInteractorInput?
    var router: PlacesRouterInput?
    
    private let dataProvider: PlacesDataProviderInput
    
    
    // MARK: - Init
    
    init(dataProvider: PlacesDataProviderInput) {
        self.dataProvider = dataProvider
    }
}


// MARK: - PlacesViewOutput
extension PlacesPresenter: PlacesViewOutput {
   
    // MARK: - BaseViewOutput
    
    func viewIsReady() {
        let viewModel = dataProvider.createViewModel()
        view?.update(with: viewModel)
        view?.showLoading()
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        
    }
    
}


// MARK: - PlacesInteractorOutput
extension PlacesPresenter: PlacesInteractorOutput {
  
}

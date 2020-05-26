//
//  ProfilePresenter.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

protocol ProfileViewOutput: ViewOutput {
    func didSelectCell(at indexPath: IndexPath)
}

protocol ProfileInteractorOutput: class {
    
}


final class ProfilePresenter {
    
    // MARK: - Properties
    
    weak var view: ProfileViewInput?
    
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?
    
    private let dataProvider: ProfileDataProviderInput
    
    
    // MARK: - Init
    
    init(dataProvider: ProfileDataProviderInput) {
        self.dataProvider = dataProvider
    }
}


// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
   
    // MARK: - BaseViewOutput
    
    func viewIsReady() {
        let viewModel = dataProvider.createViewModel()
        
        view?.setTitle("Ramazan Magomedov")
        view?.update(with: viewModel)
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        
    }
    
}


// MARK: - ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {
  
}

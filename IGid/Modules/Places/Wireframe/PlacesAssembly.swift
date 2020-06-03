//
//  PlacesAssembly.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class PlacesAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = PlacesViewController()
        let router = PlacesRouter(transition: view)
        
        let distanceService = CompositionFactory.shared.core.distanceService
        
        let dataProvider = PlacesDataProvider(distanceService: distanceService)
        let presenter = PlacesPresenter(dataProvider: dataProvider)
        
        let placesService = CompositionFactory.shared.service.placesService
        let interactor = PlacesInteractor(placesService: placesService)
                
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        let nav = UINavigationController()
        nav.viewControllers = [view]
        
        return nav
        
    }

}

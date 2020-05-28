//
//  PlaceCardAssembly.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import UIKit

final class PlaceCardAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = PlaceCardViewController()
        let router = PlaceCardRouter(transition: view)
        
        let dataProvider = PlaceCardDataProvider()
        let presenter = PlaceCardPresenter(dataProvider: dataProvider)
        
        let interactor = PlaceCardInteractor()
                
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
        
    }

}

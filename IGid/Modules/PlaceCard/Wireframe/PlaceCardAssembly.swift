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
        let sliderDataSource = PlaceCardSliderDataSource()
        let router = PlaceCardRouter(transition: view)
        
        let presenter = PlaceCardPresenter()
        let interactor = PlaceCardInteractor()
                        
        view.presenter = presenter
        
        view.dataSource = sliderDataSource
        sliderDataSource.delegate = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        view.modalPresentationStyle = .overFullScreen
        
        return view
        
    }

}

//
//  ProfileAssembly.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ProfileAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = ProfileViewController()
        let router = ProfileRouter(transition: view)
        
        let dataProvider = ProfileDataProvider()
        let presenter = ProfilePresenter(dataProvider: dataProvider)
        
        let interactor = ProfileInteractor()
                
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

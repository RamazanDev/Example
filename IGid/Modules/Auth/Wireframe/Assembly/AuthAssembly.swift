//
//  AuthAssembly.swift
//  IGid
//
//  Created by Магомедов Рамазан on 02.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class AuthAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        let view = AuthViewController()
        let preseter = AuthPresenter()
        
        view.presenter = preseter
        preseter.view = view
        
        let authService = CompositionFactory.shared.service.authService
        let userService = CompositionFactory.shared.service.userService
        let interactor = AuthInteractor(authService: authService, userService: userService)
        
        preseter.interactor = interactor
        interactor.presenter = preseter
        
        let router = AuthRouter(transition: view)
        
        preseter.router = router
        
        let nav = UINavigationController()
        nav.viewControllers = [view]
        return nav
    }
    
}

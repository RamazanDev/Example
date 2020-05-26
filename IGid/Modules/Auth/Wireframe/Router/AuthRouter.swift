//
//  AuthRouter.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit
import GoogleSignIn

protocol AuthRouterInput {
    func showMainTabBarController()
    func showGoogleAuthScreen()
}

final class AuthRouter {
    
    private weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}

extension AuthRouter: AuthRouterInput {
    
    func showMainTabBarController() {
        MainRouter.shared.openMainTabBar()
    }
    
    func showGoogleAuthScreen() {
        GIDSignIn.sharedInstance()?.presentingViewController = transition as? UIViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
    
}

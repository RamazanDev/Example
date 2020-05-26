//
//  AuthPresenter.swift
//  IGid
//
//  Created by Магомедов Рамазан on 05.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import GoogleSignIn

protocol AuthViewOutput: ViewOutput {
    func googleAuthClick()
}

protocol AuthInteractorOutput: class {
    
    func successAuthUser(user: UserModel)
    func failureAuthUser()
    
}

final class AuthPresenter: NSObject {
    
    var interactor: AuthInteractorInput?
    var router: AuthRouterInput?
    weak var view: AuthViewInput?
    
}

extension AuthPresenter: AuthViewOutput {
    
    func viewIsReady() {
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    func googleAuthClick() {
        router?.showGoogleAuthScreen()
    }
    
}

extension AuthPresenter: AuthInteractorOutput {
    func successAuthUser(user: UserModel) {
        let successAction = AlertAction(title: "Спасибо", style: .cancel) {
            self.router?.showMainTabBarController()
        }
        view?.showAlert(title: "\(user.name) \nсчастливых поездок!", message: nil, actions: [successAction])
    }
    
    func failureAuthUser() {
        
    }
}

extension AuthPresenter: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        interactor?.authWithGoogle(user: user, error: error)
    }

}

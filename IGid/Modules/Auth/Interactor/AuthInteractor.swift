//
//  AuthInteractor.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import GoogleSignIn

protocol AuthInteractorInput {
    func authWithGoogle(user: GIDGoogleUser, error: Error?)
}

final class AuthInteractor {
    
    weak var presenter: AuthInteractorOutput?
    
    private let authService: AuthService
    private let userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
    }
    
}

extension AuthInteractor: AuthInteractorInput {
    
    func authWithGoogle(user: GIDGoogleUser, error: Error?) {
        authService.loginWithGoogle(user: user, error: error) { [weak self] (result) in
            switch result {
            case .success(let user):
                self?.userService.saveUserInfo(user: UserModel(name: user.displayName ?? "No name", email: user.email!, id: user.uid)!) { (result) in
                    switch result {
                    case .success(let user):
                        self?.presenter?.successAuthUser(user: user)
                    case .failure(let error):
                        dump(error)
                    }
                }
            case .failure(let error):
                dump(error)
            }
        }
        
    }
    
}

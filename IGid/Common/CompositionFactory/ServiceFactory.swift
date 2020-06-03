//
//  ServiceFactory.swift
//  IGid
//
//  Created by Магомедов Рамазан on 09.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

extension CompositionFactory {
    
    final class ServiceFactory: DependencyFactory {

        var authService: AuthService {
            
            return unshared( factory: {
                return AuthServiceImp()
            })
            
        }
        
        var userService: UserService {
            return unshared( factory: {
                return UserServiceImp()
            })
            
        }
        
        var placesService: PlacesService {
            return unshared( factory: {
                return PlacesServiceImp()
            })
            
        }
    }
}

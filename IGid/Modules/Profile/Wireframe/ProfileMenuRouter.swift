//
//  ProfileRouter.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol ProfileRouterInput {

}

final class ProfileRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}


// MARK: - ProfileRouterInput
extension ProfileRouter: ProfileRouterInput {
   
}

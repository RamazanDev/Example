//
//  PlacesRouter.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol PlacesRouterInput {

}

final class PlacesRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}


// MARK: - PlacesRouterInput
extension PlacesRouter: PlacesRouterInput {
   
}

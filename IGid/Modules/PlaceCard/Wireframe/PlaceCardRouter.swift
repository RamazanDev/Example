//
//  PlaceCardRouter.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import UIKit

protocol PlaceCardRouterInput {
    
    func close()
    func openMapModule(place: PlaceModel)

}

final class PlaceCardRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}


// MARK: - PlaceCardRouterInput
extension PlaceCardRouter: PlaceCardRouterInput {
    func close() {
        transition?.closeModule(nil)
    }
    
    func openMapModule(place: PlaceModel) {
        transition?.push(with: MapAssembly.Model(place: place), openModuleType: MapAssembly.self)
    }
    
}

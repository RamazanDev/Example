//
//  CompositionFactory.swift
//  IGid
//
//  Created by Магомедов Рамазан on 09.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

final class CompositionFactory: DependencyFactory {
    
    static let shared = CompositionFactory()
    
    private override init() {
        super.init()
    }
    
    var core: CoreFactory {
        
        return shared( factory: {
            return CoreFactory()
        })
        
    }
    
    var service: ServiceFactory {
        
        return shared( factory: {
            return ServiceFactory()
        })
        
    }
    
}

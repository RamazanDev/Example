//
//  RouterInput.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

protocol RouterInput {
    var transition: ModuleTransitionHandler? { get }
    func dismissModule()
}

extension RouterInput {
    
    func dismissModule() {
        transition?.closeModule()
    }
}

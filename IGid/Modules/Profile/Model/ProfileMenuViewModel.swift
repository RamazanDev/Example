//
//  ProfileViewModel.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Vorchami. All rights reserved.
//

import UIKit.UIView

struct ProfileViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case wishList(configurator: TableCellConfiguratorProtocol)
        case goOut(configurator: TableCellConfiguratorProtocol)
        case addPlace(configurator: TableCellConfiguratorProtocol)

        
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
                
            case let .wishList(configurator),
                 let .goOut(configurator),
                 let .addPlace(configurator):


                
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

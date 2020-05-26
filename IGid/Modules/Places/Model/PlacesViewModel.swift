//
//  PlacesViewModel.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit.UIView

struct PlacesViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case accountInfo(configurator: TableCellConfiguratorProtocol)
        
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
                
            case let .accountInfo(configurator):
                
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

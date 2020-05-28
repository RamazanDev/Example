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
        
        case place(configurator: TableCellConfiguratorProtocol)
        
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
                
            case let .place(configurator):
                
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

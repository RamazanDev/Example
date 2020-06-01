//
//  PlaceCardViewModel.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import UIKit.UIView

struct PlaceCardViewModel {
    
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

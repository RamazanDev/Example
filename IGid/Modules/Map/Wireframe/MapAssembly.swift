//
//  MapAssembly.swift
//  IGid
//
//  Created by Рамазан on 02.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MapAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        let view = MapViewController()
        let presenter = MapPresenter()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}

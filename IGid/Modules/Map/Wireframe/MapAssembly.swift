//
//  MapAssembly.swift
//  IGid
//
//  Created by Рамазан on 02.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MapAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        
        let model = (model as! Model)

        let view = MapViewController()
        let presenter = MapPresenter(place: model.place)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
}

extension MapAssembly {
    struct Model: TransitionModel {
        let place: PlaceModel
    }
}

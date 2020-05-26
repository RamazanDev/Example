//
//  LaunchAssembly.swift
//  IGid
//
//  Created by Магомедов Рамазан on 04.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class LaunchAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        let view = LaunchViewController()
        
        return view
    }
    
}

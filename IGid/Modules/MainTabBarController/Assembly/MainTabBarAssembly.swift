//
//  MainTabBarAssembly.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MainTabBarAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = MainTabBarController()
        
        return view
    }
}

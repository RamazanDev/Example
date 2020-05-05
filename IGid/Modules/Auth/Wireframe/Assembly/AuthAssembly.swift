//
//  AuthAssembly.swift
//  IGid
//
//  Created by Магомедов Рамазан on 02.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class AuthAssembly {
    
    static func assembly() -> UIViewController {
        let view = AuthViewController()
        
        let nav = UINavigationController()
        nav.viewControllers = [view]
        return nav
    }
    
}

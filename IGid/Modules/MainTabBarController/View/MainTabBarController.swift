//
//  MainTabBarController.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit
enum TabBarItems: CaseIterable {
    case places
    case profile
    
    var title: String {
        switch self {
        case .places:
            return Localized.tabBarPlaces()
        case .profile:
            return Localized.tabBarProfile()
        }
    }
    
    var image: UIImage? {
        switch self {
        case .places:
            return Images.placesListIconTabBarUnSelectred()
        case .profile:
            return Images.profileIconTabBarUnSelected()
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .places:
            return Images.placesListIconTabBarSelected()
        case .profile:
            return Images.profileIconTabBarSelected()
        }
        
    }
    
}


protocol MainTabBarInput: Loadable, AlertPresentable {
    
}

final class MainTabBarController: UITabBarController {
    
    var presenter: MainTabBarOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        initTabs()
    }
    
    private func initTabs() {
        viewControllers = TabBarItems.allCases.map {
            
            let viewController: UIViewController
            
            switch $0 {
                
            case .profile:
                viewController = ProfileAssembly.assembleModule()
            case .places:
                viewController = PlacesAssembly.assembleModule()
            }
            
            viewController.tabBarItem.title = $0.title
            viewController.tabBarItem.image = $0.image
            viewController.tabBarItem.selectedImage = $0.selectedImage
            
            return viewController
        }
        
        tabBar.tintColor = .black
        tabBar.barTintColor = .white
    }
    
    
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    
}

extension MainTabBarController: MainTabBarInput {
    
}

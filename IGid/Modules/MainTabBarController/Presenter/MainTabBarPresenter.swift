//
//  MainTabBarPresenter.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

protocol MainTabBarOutput: ViewOutput {
    
}

final class MainTabBarPresenter {
    
    weak var view: MainTabBarInput?
    
}

extension MainTabBarPresenter: MainTabBarOutput {
    
}

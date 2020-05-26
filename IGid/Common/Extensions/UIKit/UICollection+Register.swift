//
//  UICollection+Register.swift
//  IGid
//
//  Created by Магомедов Рамазан on 25.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(cellTypes: [UICollectionViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
}

extension UITableView {
    
    func register(cellTypes: [UITableViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellReuseIdentifier: reuseIdentifier)
        }
    }
}

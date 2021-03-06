//
//  Configurable.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

protocol Configurable {
  
    associatedtype Model
    func configure(with model: Model)
}

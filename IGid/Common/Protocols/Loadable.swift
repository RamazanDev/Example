//
//  Loadable.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

protocol Loadable: AnyObject {
    func showLoading()
    func hideLoading()
}

extension Loadable {
    func showLoading() { }
    func hideLoading() { }

}

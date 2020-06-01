//
//  UIView + Edges.swift
//  IGid
//
//  Created by Магомедов Рамазан on 26.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIView {
    func edges(to view: UIView, top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat =  0, right: CGFloat = 0) {
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottom),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -right)
        ])
    }
    
    func edgesFromSafeArea(to view: UIView,top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat =  0, right: CGFloat =  0) {
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottom),
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: left),
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -right)
        ])
    }
}

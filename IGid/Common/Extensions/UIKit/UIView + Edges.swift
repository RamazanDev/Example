//
//  UIView + Edges.swift
//  IGid
//
//  Created by Магомедов Рамазан on 26.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIView {
    func edges(to view: UIView, edgesInserts: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: edgesInserts.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -edgesInserts.bottom),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: edgesInserts.left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -edgesInserts.right)
        ])
    }
    
    func edgesFromSafeArea(to view: UIView, edgesInserts: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edgesInserts.top),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -edgesInserts.bottom),
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: edgesInserts.left),
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -edgesInserts.right)
        ])
    }
}

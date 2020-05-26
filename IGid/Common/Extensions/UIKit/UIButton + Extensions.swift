//
//  UIButton + Extensions.swift
//  IGid
//
//  Created by Магомедов Рамазан on 05.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont? = Font.sfuiDisplayRegular(size: 20),
                     isShadow: Bool = false,
                     cornerRadius: CGFloat = 4,
                     image: UIImage = UIImage()) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRadius
        
        let iconButton = UIImageView()
        iconButton.image = image
        iconButton.contentMode = .scaleAspectFit
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconButton)
        iconButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        iconButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: 32).isActive = true

        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
    }
    
    
}

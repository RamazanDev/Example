//
//  UILabel + Extensions.swift
//  IGid
//
//  Created by Магомедов Рамазан on 05.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = Font.sfuiDisplayRegular(size: 20)) {
        self.init()
        
        self.text = text
        self.font = font
    }
}

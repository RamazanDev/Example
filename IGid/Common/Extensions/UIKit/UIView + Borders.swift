//
//  UIView + Borders.swift
//  IGid
//
//  Created by Магомедов Рамазан on 25.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var borderWidth: CGFloat {
        
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
        
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        
        set {
            layer.borderColor = newValue?.cgColor
        }
        
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = false
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    func addCornerRadiuses(corners: UIRectCorner, radius: CGFloat) {
        self.clipsToBounds = true
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
//        mask.borderWidth = 1
//        mask.borderColor = UIColor.black.cgColor
        layer.mask = mask
    }
}

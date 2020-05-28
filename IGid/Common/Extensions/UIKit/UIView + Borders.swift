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
            layer.masksToBounds = true
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
    
    func addCorners(radius: CGFloat, corners: [Corners]) {
        var maskedCorners: CACornerMask = []
        
        cornerRadius = radius
        corners.forEach{ maskedCorners.insert($0.value)}
        
        self.layer.maskedCorners = maskedCorners
        
    }
    
    enum Corners {
        
        case LeftTop
        case RightTop
        case LeftBottom
        case RightBottom
        
        var value: CACornerMask {
            
            switch self {
                
            case .LeftBottom:
                
                return .layerMinXMaxYCorner
            case .LeftTop:
                
                return .layerMinXMinYCorner
            case .RightTop:
                
                return .layerMaxXMinYCorner
            case .RightBottom:
                
                return .layerMaxXMaxYCorner
            }
            
        }
    }
    
    func addShadows(color: UIColor = .black,
                    shadowOffset: CGSize = CGSize(width: 10, height: 10),
                    shadowOpacity: Float = 0.5,
                    shadowRadius: CGFloat = 1) {
        
        self.layer.shadowPath =
            UIBezierPath(roundedRect: self.bounds,
                         cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = false
    }
}

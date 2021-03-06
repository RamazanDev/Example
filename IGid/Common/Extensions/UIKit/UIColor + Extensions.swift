//
//  UIColor + Extensions.swift
//  IGid
//
//  Created by Магомедов Рамазан on 05.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func buttonRed() -> UIColor {
        return #colorLiteral(red: 0.8156862745, green: 0.007843137255, blue: 0.1058823529, alpha: 1)
    }
    
    static func mainWhite() -> UIColor {
        return #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
    }
    
    static func buttonDark() -> UIColor {
        return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    static func textBlack() -> UIColor {
        return #colorLiteral(red: 0.1607843137, green: 0.1882352941, blue: 0.2392156863, alpha: 1)
    }
    
    static func textFieldLight() -> UIColor {
        return #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    }
    
    static func backgroundLightGray() -> UIColor {
        return #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9568627451, alpha: 1)
    }
    
    static func separatorColor() -> UIColor {
        return #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9490196078, alpha: 1)
    }
    
    static func blackWithAlpha(alpha: CGFloat = 0.55) -> UIColor {
        return UIColor.black.withAlphaComponent(alpha)
    }
    
}

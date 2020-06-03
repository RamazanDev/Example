//
//  Double+Distance.swift
//  IGid
//
//  Created by Рамазан on 03.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

extension Double {
    func toDistanceFormat() -> String {
        
        if self <= 999 {
            
            return "\(self) м"
            
        } else {
            
            let correctDistance: Int = Int(self / 1000)
            
            return "\(correctDistance.formattedWithSeparator) км"
            
        }
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {

    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
    
}

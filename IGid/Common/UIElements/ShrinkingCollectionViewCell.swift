//
//  ShrinkingCollectionViewCell.swift
//  IGid
//
//  Created by Рамазан on 28.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

class ShrinkingCollectionViewCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        
        didSet {
            
            if isHighlighted {
                
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                })
            } else {
                
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
            
        }
        
    }
    
}

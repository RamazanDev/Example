//
//  PlaceCardSliderCell.swift
//  IGid
//
//  Created by Рамазан on 01.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

final class PlaceCardSliderCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private weak var imageViewCenterYLayoutConstraint: NSLayoutConstraint!
    
    private var parallaxOffset: CGFloat = 0 {
        didSet {
            imageViewCenterYLayoutConstraint.constant = parallaxOffset
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    private func setupSubviews() {
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.clipsToBounds = true
        self.clipsToBounds = true
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        imageViewCenterYLayoutConstraint = imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        imageViewCenterYLayoutConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaceCardSliderCell: Configurable {
    struct Model {
        let imageURL: URL?
    }
    
    func configure(with model: Model) {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: model.imageURL, completed: nil)
    }
    
    func updateParalaxOffset(bounds: CGRect) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let offsetFromCenter = CGPoint(x: center.x - self.center.x, y: center.y - self.center.y)
        let maxVerticalOffset = (bounds.width) + (self.bounds.width)

        let scaleFactor = 160 / maxVerticalOffset
        
        parallaxOffset = offsetFromCenter.x * scaleFactor
    }
    
}

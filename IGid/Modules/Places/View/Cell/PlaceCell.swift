//
//  PlaceCell.swift
//  IGid
//
//  Created by Магомедов Рамазан on 26.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class PlaceCell: ShrinkingTableViewCell {
    
    // MARK: - Views
    
    private let backView = UIView()
    private let placeImageView = UIImageView()
    private let nameLabel = EdgeInsetLabel()
    let distanceLabel = EdgeInsetLabel()
    
    var distanceBottomConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .white
        backView.cornerRadius = 8
        backView.clipsToBounds = true
        
        self.addSubview(backView)
        
        backView.edges(to: self, top: 8, left: 16, bottom: 8, right: 16)
        backView.heightAnchor.constraint(equalToConstant: InterfaceUtils.screenHeight / 3.5).isActive = true
        
        
        placeImageView.contentMode = .scaleToFill
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        placeImageView.clipsToBounds = true
        
        backView.addSubview(placeImageView)
        
        placeImageView.edges(to: backView)
        
        let labels = [nameLabel, distanceLabel]
        
        labels.forEach {
            $0.textColor = UIColor.textFieldLight()
            $0.numberOfLines = 1
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor.blackWithAlpha()
            $0.layer.masksToBounds = true
        }
        
        nameLabel.font = Font.sfuiDisplayBold(size: 32)
        nameLabel.addCorners(radius: 8, corners: [.LeftTop,.RightBottom,.RightTop])
        nameLabel.textInsets = UIEdgeInsets(top: 8, left: 12, bottom: 4, right: 12)

        backView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 8)
        ])
        
        distanceLabel.font = Font.sfuiDisplayBold(size: 18)
        distanceLabel.addCorners(radius: 8, corners: [.LeftBottom,.RightBottom])
        distanceLabel.textInsets = UIEdgeInsets(top: 0, left: 12, bottom: 8, right: 12)
        
        backView.addSubview(distanceLabel)
        
        distanceBottomConstraint = distanceLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8)
        distanceBottomConstraint.isActive = true
        NSLayoutConstraint.activate([
            distanceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            nameLabel.bottomAnchor.constraint(equalTo: distanceLabel.topAnchor)
        ])
        
    }
    
}

extension PlaceCell: Configurable {
    struct Model {
        let backgroundImage: URL?
        let name: String
        let distance: Double
    }
    
    func configure(with model: Model) {
        placeImageView.image = #imageLiteral(resourceName: "LaunchScreenImage")
        nameLabel.text = "Дербент"
        distanceLabel.text = "320 км"
    }
}

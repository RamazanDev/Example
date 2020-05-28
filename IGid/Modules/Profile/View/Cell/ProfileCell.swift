//
//  ProfileCell.swift
//  IGid
//
//  Created by Магомедов Рамазан on 25.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ProfileCell: UITableViewCell {
    
    // MARK: - Views
    
    let backView = UIView()
    private let iconImageView = UIImageView()
    private let imageContainer = UIView()
    private let titleLabel = UILabel()
    private let arrowImageView = UIImageView()
    private var separatorsViews: [UIView] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.backgroundColor = .clear
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .white
        
        addSubview(backView)
        backView.edges(to: self, edgesInserts: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageContainer.cornerRadius = 8
        imageContainer.clipsToBounds = true
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        imageContainer.addSubview(iconImageView)
        backView.addSubview(imageContainer)
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(equalToConstant: 32),
            imageContainer.widthAnchor.constraint(equalToConstant: 32),
            imageContainer.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            imageContainer.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            
            iconImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 8),
            iconImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -8),
            iconImageView.leftAnchor.constraint(equalTo: imageContainer.leftAnchor, constant: 8),
            iconImageView.rightAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: -8)
        ])
        
        titleLabel.numberOfLines = 1
        titleLabel.font = Font.sfuiDisplayRegular(size: 16)
        titleLabel.textColor = UIColor.textBlack()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
        
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.image = Images.arrowIcon()
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(arrowImageView)
        NSLayoutConstraint.activate([
            arrowImageView.heightAnchor.constraint(equalToConstant: 20),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            titleLabel.rightAnchor.constraint(equalTo: arrowImageView.leftAnchor, constant: 16)
        ])
        
        let topSeparatorView = UIView()
        topSeparatorView.backgroundColor = UIColor.separatorColor()
        topSeparatorView.isHidden = true
        topSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(topSeparatorView)
        NSLayoutConstraint.activate([
            topSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            topSeparatorView.topAnchor.constraint(equalTo: backView.topAnchor),
            topSeparatorView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            topSeparatorView.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor)
        ])
        
        let bottomSeparatorView = UIView()
        bottomSeparatorView.backgroundColor = UIColor.separatorColor()
        bottomSeparatorView.isHidden = true
        bottomSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(bottomSeparatorView)
        NSLayoutConstraint.activate([
            bottomSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            bottomSeparatorView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            bottomSeparatorView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bottomSeparatorView.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor)
        ])
        
        separatorsViews.append(topSeparatorView)
        separatorsViews.append(bottomSeparatorView)
    }
}

extension ProfileCell: Configurable {
    struct Model {
        let cornerType: CornerCellType
        let image: Image
        let text: String
    }
    
    func configure(with model: Model) {
        
        switch model.cornerType {
            
        case .top:
            
            backView.addCorners(radius: 8, corners: [.LeftTop, .RightTop])
        case .bottom:
            
            backView.addCorners(radius: 8, corners: [.LeftBottom, .RightBottom])
        default:
            separatorsViews.forEach{ $0.isHidden = false }
        }
        
        titleLabel.text = model.text
        
        iconImageView.tintColor = model.image.tintColor
        imageContainer.backgroundColor = model.image.backgroundColor
        iconImageView.image = model.image.image
        
    }
    
    enum CornerCellType {
        case top
        case bottom
        case none
    }
    
    struct Image {
        let image: UIImage
        let backgroundColor: UIColor
        let tintColor: UIColor
    }
    
}

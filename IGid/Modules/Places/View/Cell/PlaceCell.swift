//
//  PlaceCell.swift
//  IGid
//
//  Created by Магомедов Рамазан on 26.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class PlaceCell: UITableViewCell {
    
    // MARK: - Views
    
    private let backView = UIView()
    private let backgroundImageView = UIImageView()
    private let nameLabel = UILabel()
    private let distanceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .white
        
        self.addSubview(backView)
        
        backView.edges(to: self, edgesInserts: UIEdgeInsets(top: 8, left: 16, bottom: 16, right: 8))
    }
}

extension PlaceCell: Configurable {
    struct Model {
        let backgroundImage: URL?
        let name: String
        let distance: Double
    }
    
    func configure(with model: Model) {
        
    }
}

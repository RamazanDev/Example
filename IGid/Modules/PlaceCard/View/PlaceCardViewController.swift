//
//  PlaceCardViewController.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import UIKit

protocol PlaceCardViewInput: AlertPresentable, Loadable {
    func update(with viewModel: PlaceCardViewModel)
}

final class PlaceCardViewController: UIViewController {
    
    // MARK: - Views
    
    private let bottomView = UIView()
    private let wishButton = UIButton()
    private let youtubeButton = UIButton()
    private let roadButton = UIButton()
    private let closeButton = UIButton()
    private let collectionView: UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = UIColor.backgroundLightGray()
        return collection
    }()
    
    
    // MARK: - Properties
    
    var presenter: PlaceCardViewOutput?
    var dataSource: PlaceCardSLiderDataSourceInput?
    

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func setupSubviews() {
        
        collectionView.delegate = dataSource as? UICollectionViewDelegate
        collectionView.dataSource = dataSource as? UICollectionViewDataSource
        dataSource?.collection = collectionView
        collectionView.register(cellTypes: [
            PlaceCardSliderCell.self
        ])
        
        self.view.addSubview(collectionView)
        collectionView.edges(to: self.view)
        
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        closeButton.setImage(Images.xMarkIcon(), for: .normal)
        closeButton.tintColor = .white
        closeButton.backgroundColor = UIColor.blackWithAlpha()
        closeButton.cornerRadius = 4
        closeButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        self.view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            closeButton.heightAnchor.constraint(equalToConstant: 32),
            closeButton.widthAnchor.constraint(equalToConstant: 32)
        ])
        
        
        bottomView.cornerRadius = 18
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = UIColor.blackWithAlpha()
        
        self.view.addSubview(bottomView)
        NSLayoutConstraint.activate([
            bottomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            bottomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            bottomView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
        wishButton.setImage(Images.unSelectedHeart(), for: .normal)
        wishButton.addTarget(self, action: #selector(wishButtonClick), for: .touchUpInside)
        
        youtubeButton.setImage(Images.youtubeIcon(), for: .normal)
        youtubeButton.addTarget(self, action: #selector(youtubeButtonClick), for: .touchUpInside)
        
        roadButton.setImage(Images.compasIcon(), for: .normal)
        roadButton.addTarget(self, action: #selector(roadButtonClick), for: .touchUpInside)
        
        [wishButton, youtubeButton, roadButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.cornerRadius = 16
            $0.backgroundColor = .white
            $0.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
            bottomView.addSubview($0)
        }
        
        wishButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        let edgeSize: CGFloat = 60
        
        NSLayoutConstraint.activate([
            
            youtubeButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            youtubeButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            youtubeButton.heightAnchor.constraint(equalToConstant: edgeSize),
            youtubeButton.widthAnchor.constraint(equalToConstant: edgeSize),
            
            wishButton.heightAnchor.constraint(equalToConstant: edgeSize),
            wishButton.widthAnchor.constraint(equalToConstant: edgeSize),
            wishButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            wishButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: InterfaceUtils.screenWidth/3),
            
            roadButton.heightAnchor.constraint(equalToConstant: edgeSize),
            roadButton.widthAnchor.constraint(equalToConstant: edgeSize),
            roadButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            roadButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -InterfaceUtils.screenWidth/3),
            
        ])
        
        
        
    }
    
    @objc private func closeButtonTap() {
        presenter?.closeButtonCLick()
    }
    
    @objc private func roadButtonClick() {
        
    }
    
    @objc private func wishButtonClick() {
        
    }
    
    @objc private func youtubeButtonClick() {
        
    }
    
}

// MARK: - PlaceCardViewInput
extension PlaceCardViewController: PlaceCardViewInput {
    
    func update(with viewModel: PlaceCardViewModel) {
        dataSource?.update([])
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}

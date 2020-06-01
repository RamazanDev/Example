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
    
    // MARK: - Locals
	
    // MARK: - Properties
    
	var presenter: PlaceCardViewOutput?
    var dataSource: PlaceCardSLiderDataSourceInput?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
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
        collectionView.register(cellTypes: [
            PlaceCardSliderCell.self
        ])
        
        self.view.addSubview(collectionView)
        collectionView.edges(to: self.view)
        dataSource?.collection = collectionView
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

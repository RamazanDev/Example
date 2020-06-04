//
//  PlaceCardSliderDataSource.swift
//  IGid
//
//  Created by Рамазан on 01.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol PlaceCardSLiderDataSourceInput {
    
    var delegate: PlaceCardSLiderDataSourceOutput? { get set }
    var collection: UICollectionView? { get set }
    func update(_ data: [URL?] )
    
}

protocol PlaceCardSLiderDataSourceOutput: class {
    
}

final class PlaceCardSliderDataSource: NSObject {
    
    // MARK: - Private properties
    
    private weak var collectionView: UICollectionView?
    private weak var output: PlaceCardSLiderDataSourceOutput?
    private var sliderData: [URL?] = []
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PlaceCardSliderDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = InterfaceUtils.screenWidth
        let height = InterfaceUtils.screenHeight
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for view in collectionView!.visibleCells {
            
            guard let cell = view as? PlaceCardSliderCell else { return }
            cell.updateParalaxOffset(bounds: self.collectionView!.bounds)
        }
    }
    
    
    
}

// MARK: - UICollectionViewDataSource

extension PlaceCardSliderDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sliderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceCardSliderCell.className, for: indexPath) as? PlaceCardSliderCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: PlaceCardSliderCell.Model(imageURL: sliderData[safe: indexPath.row] ?? nil))
        
        return cell
    }
    
}

// MARK: - PlaceCardSLiderDataSourceInput

extension PlaceCardSliderDataSource: PlaceCardSLiderDataSourceInput {
    
    var collection: UICollectionView? {
        
        get {
            return self.collectionView
        }
        set {
            self.collectionView = newValue
        }
        
    }
    
    var delegate: PlaceCardSLiderDataSourceOutput? {
        
        get {
            return self.output
        }
        set {
            self.output = newValue
        }
        
    }
    
    func update(_ data: [URL?]) {
        self.sliderData = data
        collectionView?.reloadData()
    }
    
}

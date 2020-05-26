//
//  ProfileDataProvider.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Vorchami. All rights reserved.
//

import UIKit

protocol ProfileDataProviderInput {
    func createViewModel() -> ProfileViewModel
}


final class ProfileDataProvider: ProfileDataProviderInput {
    
    // MARK: - Typealiases
    
    typealias profileCellConfigurator = TableCellConfigurator<ProfileCell, ProfileCell.Model>
    
    // MARK: - ProfileDataProviderInput
    
    func createViewModel() -> ProfileViewModel {

        
        var rows: [ProfileViewModel.Row] = []
        
        let addPlaceImage = ProfileCell.Image(image: Images.carIcon()!,
                                              backgroundColor: .blue,
                                              tintColor: .white)
        
        let wishListImage = ProfileCell.Image(image: Images.wishIcon()!,
                                              backgroundColor: #colorLiteral(red: 1, green: 0.5411764706, blue: 0.07843137255, alpha: 1),
                                              tintColor: .white)
        
        let goOutImage = ProfileCell.Image(image: Images.goOutIcon()!,
                                           backgroundColor: #colorLiteral(red: 1, green: 0.3411764706, blue: 0.2392156863, alpha: 1),
                                           tintColor: .white)
        
        
        rows.append(.wishList(configurator: profileCellConfigurator(item: ProfileCell.Model(cornerType: .top, image: addPlaceImage, text: Localized.profileAddPlace()))))
        

        rows.append(.wishList(configurator: profileCellConfigurator(item: ProfileCell.Model(cornerType: .none, image: wishListImage, text: Localized.profileWishList()))))
        
        rows.append(.goOut(configurator: profileCellConfigurator(item: ProfileCell.Model(cornerType: .bottom, image: goOutImage, text: Localized.profileGoOut()))))
        
        return ProfileViewModel(rows: rows)
    }
}

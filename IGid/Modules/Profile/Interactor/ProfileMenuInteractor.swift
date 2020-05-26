//
//  ProfileInteractor.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//


protocol ProfileInteractorInput {
}


final class ProfileInteractor {
    
    // MARK: - Properties
    
    weak var presenter: ProfileInteractorOutput?
    
    
    // MARK: - Init
    
    init() {
    }
    
    
}


// MARK: - ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
    
}

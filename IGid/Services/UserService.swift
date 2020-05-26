//
//  UserService.swift
//  IGid
//
//  Created by Магомедов Рамазан on 26.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol UserService {
    func saveUserInfo(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> Void)
    func getUserData(user: User, completion: @escaping (Result<UserModel, Error>) -> Void)
}

final class UserServiceImp: UserService {
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveUserInfo(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> Void) {
        self.usersRef.document(user.id).setData(user.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getUserData(user: User, completion: @escaping (Result<UserModel, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let muser = UserModel(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToMUser))
                    return
                }
                completion(.success(muser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }
    

    
}


//
//  AuthService.swift
//  IGid
//
//  Created by Магомедов Рамазан on 09.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Firebase
import FirebaseAuth
import GoogleSignIn
import FirebaseFirestore

protocol AuthService {
    func loginWithGoogle(user: GIDGoogleUser!, error: Error?, completion: @escaping (Result<User, Error>) -> Void)
}

final class AuthServiceImp: AuthService {
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func loginWithGoogle(user: GIDGoogleUser!, error: Error?, completion: @escaping (Result<User, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let auth = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
            
        }
    }
}

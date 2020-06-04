//
//  PlacesService.swift
//  IGid
//
//  Created by Рамазан on 29.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol PlacesService {
    func getAllPlaces(completion: @escaping (Result<[PlaceModel], Error>) -> Void)
}

final class PlacesServiceImp: PlacesService {
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    private var placesRef: CollectionReference {
        return db.collection("places")
    }
    
    func getAllPlaces(completion: @escaping (Result<[PlaceModel], Error>) -> Void) {
        placesRef.getDocuments(completion: { (querySnapshot, error) in
            
               if let err = error {
                print("Error getting documents: \(err)")
                
            } else {
                var models: [PlaceModel] = []
                
                querySnapshot?.documents.map({ (document) -> Void in
                    if let model = PlaceModel(document: document) {
                        models.append(model)
                    }
                })
                
                completion(.success(models))
            }
        })
        
    }
    
}

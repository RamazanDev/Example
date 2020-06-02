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
    func getAllPlaces()
}

final class PlacesServiceImp: PlacesService {
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    private var placesRef: CollectionReference {
        return db.collection("places")
    }
    
    func getAllPlaces() {
        placesRef.getDocuments { (result, error) in
            print("result")
            dump(result)
            print("error")
            dump(error)
        }
        
    }
    
}

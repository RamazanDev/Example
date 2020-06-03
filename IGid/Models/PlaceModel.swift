//
//  PlaceModel.swift
//  IGid
//
//  Created by Рамазан on 01.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct PlaceModel {
    let id: String
    let name: String
    let description: String
    let location: Location
    let images: [URL?]
    let youtubeLink: URL?
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let name = data["name"] as? String,
            let youtubeLink = data["youtubeLink"] as? String,
            let latitude = data["latitude"] as? Float,
            let longitude = data["longitude"] as? Float,
            let description = data["description"] as? String else { return nil }
        
        self.id = document.documentID
        self.name = name
        self.description = description
        self.location = Location(longitude: longitude, latitude: latitude)
        self.youtubeLink = URL(string: youtubeLink)
        self.images = []
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let name = data["name"] as? String,
            let youtubeLink = data["youtubeLink"] as? String,
            let latitude = data["latitude"] as? Float,
            let longitude = data["longitude"] as? Float,
            let description = data["description"] as? String else { return nil }
        
        self.id = document.documentID
        self.name = name
        self.description = description
        self.location = Location(longitude: longitude, latitude: latitude)
        self.youtubeLink = URL(string: youtubeLink)
        self.images = []
    }
    
}

struct Location {
    let longitude: Float
    let latitude: Float
}

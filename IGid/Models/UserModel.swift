//
//  UserModel.swift
//  IGid
//
//  Created by Магомедов Рамазан on 26.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct UserModel: Decodable {
    let name: String
    let email: String
    let id: String
    
    init?(name: String, email: String, id: String) {
        self.name = name
        self.email = email
        self.id = id
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil}
        guard let name = data["name"] as? String,
            let id = data["uid"] as? String,
            let email = data["email"] as? String else { return nil }
        
        self.name = name
        self.email = email
        self.id = id
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let name = data["name"] as? String,
            let id = data["uid"] as? String,
            let email = data["email"]  as? String else { return nil }
        
        self.name = name
        self.email = email
        self.id = id
    }
    
    var representation: [String: Any] {
        var rep = ["username": name]
        rep["email"] = email
        rep["id"] = id
        return rep
    }
}

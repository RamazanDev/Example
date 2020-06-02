//
//  PlaceModel.swift
//  IGid
//
//  Created by Рамазан on 01.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

struct PlaceModel {
    let name: String
    let description: String
    let location: Location
    let images: [URL?]
    let youtubeLink: URL?
}

struct Location {
    let longitude: Float
    let latitude: Float
}

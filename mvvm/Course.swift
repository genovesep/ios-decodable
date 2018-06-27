//
//  Course.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numberOfLessons: Int
    
    // swift 4.0
    /*private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case numberOfLessons = "number_of_lessons"
        case id, name, link
        case imageUrl = "image_url"
    }*/
}

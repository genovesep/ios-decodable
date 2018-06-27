//
//  WebsiteDescription.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import Foundation

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

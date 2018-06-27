//
//  SWWorld.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import Foundation

extension String {
    func planetApiId() -> Int {
        var s = self
        let lowerBound = String.Index(encodedOffset: 21)
        let upperBound = String.Index(encodedOffset: 27)
        let objectRequestType = s[lowerBound...upperBound]
        s = s.replacingOccurrences(of: "https://swapi.co/api/", with: "")
        s = s.replacingOccurrences(of: objectRequestType + "/", with: "")
        s = s.replacingOccurrences(of: "/", with: "")
        return Int(s)!
    }
}

struct SWWorld: Decodable {
    let name: String
    let population: String
    let residents: [String]
    let url: String
}

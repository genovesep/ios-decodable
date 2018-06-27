//
//  SWFilm.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import Foundation

extension String {
    func filmApiId() -> Int {
        var s = self
        let lowerBound = String.Index(encodedOffset: 21)
        let upperBound = String.Index(encodedOffset: 25)
        let objectRequestType = s[lowerBound...upperBound]
        s = s.replacingOccurrences(of: "https://swapi.co/api/", with: "")
        s = s.replacingOccurrences(of: objectRequestType + "/", with: "")
        s = s.replacingOccurrences(of: "/", with: "")
        return Int(s)!
    }
}

struct SWFilm: Decodable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let releaseDate: String
    let characters: [String]
    let url: String
}

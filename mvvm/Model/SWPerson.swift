//
//  SWPerson.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import Foundation

struct SWPerson: Decodable {
    let name: String
    let gender: String
    let birthYear: String
    let homeworld: String
    let films: [String]
    let url: String
    
    func parseSWPersonHomeWorld(completion: @escaping(_ result: SWWorld) -> ()) {
        MainService.sharedInstance.getSWWorld(withId: homeworld.planetApiId()) { (swworld) in
            guard let world = swworld else { return }
            completion(world)
        }
    }
    
    func parseSWPersonFilms(completion: @escaping(_ result: [SWFilm]) -> ()) {
        let dGroup = DispatchGroup()
        var resFilms: [SWFilm] = []
        
        films.forEach { (film) in
            dGroup.enter()
            let id = film.filmApiId()
            MainService.sharedInstance.getSWFilm(withId: id, completion: { (swfilm) in
                guard let film = swfilm else { return }
                resFilms.append(film)
                dGroup.leave()
            })
        }
        
        dGroup.notify(queue: .main) {
            completion(resFilms)
        }
    }
    
}

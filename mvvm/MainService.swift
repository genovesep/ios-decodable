//
//  MainService.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import Foundation

final class MainService {
    static let sharedInstance = MainService()
    
    // Static properties
    fileprivate let baseUrl = "https://swapi.co/api/"
    
    // one should not init singleton
    private init() {}
    
    // GET: SWPerson
    func getSWPerson(withId id: Int, completion: @escaping (_ result: SWPerson?) -> ()) {
        let stringUrl = baseUrl + "people/\(id)/"
        guard let url = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                debugPrint((error?.localizedDescription)!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let swperson = try decoder.decode(SWPerson.self, from: data)
                completion(swperson)
            } catch let err {
                debugPrint("Failed to decode: \(err)")
                completion(nil)
            }
        }.resume()
    }
    
    // GET: SWWorld
    func getSWWorld(withId id: Int, completion: @escaping(_ result: SWWorld?) -> ()) {
        let stringUrl = baseUrl + "planets/\(id)/"
        guard let url = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                debugPrint((error?.localizedDescription)!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let swworld = try decoder.decode(SWWorld.self, from: data)
                completion(swworld)
            } catch let err {
                debugPrint("Failed to decode: \(err.localizedDescription)")
                completion(nil)
            }
            }.resume()
    }
    
    // GET: SWFilm
    func getSWFilm(withId id: Int, completion: @escaping(_ result: SWFilm?) -> ()) {
        let stringUrl = baseUrl + "films/\(id)/"
        guard let url = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                debugPrint((error?.localizedDescription)!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let swfilm = try decoder.decode(SWFilm.self, from: data)
                completion(swfilm)
            } catch let err {
                debugPrint("Failed to decode: \(err.localizedDescription)")
                completion(nil)
            }
            }.resume()
    }
}

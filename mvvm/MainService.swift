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
    
    // one should not init singleton
    private init() {}
    
    // GET: courses
    func getCourses() {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses_snake_case") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                debugPrint((error?.localizedDescription)!)
                
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                // swift 4.1
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                print(courses)
            } catch let err {
                debugPrint("Failed to decode: \(err.localizedDescription)")
            }
            
            
            
        }.resume()
    }
}

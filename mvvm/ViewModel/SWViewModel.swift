//
//  SWViewModel.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import Foundation

final class SWViewModel {
    
    var people: [SWPerson]!
    let dGroup = DispatchGroup()
    
    func customInitSWPerson(completion: @escaping (_ finish: Bool) -> ()) {
        people = []
        let idArray = [1,2,3,4,5,6,7,8,9,10]
        idArray.forEach { (id) in
            self.dGroup.enter()
            MainService.sharedInstance.getSWPerson(withId: id) { (result) in
                guard let swperson = result else { return }
                self.people.append(swperson)
                self.dGroup.leave()
            }
        }
        
        dGroup.notify(queue: .main) {
            completion(true)
        }
    }
}

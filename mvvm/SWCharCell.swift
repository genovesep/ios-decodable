//
//  SWCharCell.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import UIKit

fileprivate enum CellIdentifier: String {
    case SWFilmCell = "SWFilmCell"
}

class SWCharCell: UITableViewCell {

    // cell properties
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBirthYear: UILabel!
    @IBOutlet weak var lblHomeWorld: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var films: [SWFilm] = []
    
    func customInit(withSWPerson person: SWPerson) {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        lblName.text = checkGender(person: person)
        lblGender.text = ""
        lblBirthYear.text = person.birthYear
        
        person.parseSWPersonHomeWorld { (swworld) in
            DispatchQueue.main.async {
                self.lblHomeWorld.text = swworld.name
            }
        }
        
        person.parseSWPersonFilms { (swfilms) in
            self.films = swfilms
            self.collectionView.reloadData()
        }
    }
    
    func checkGender(person: SWPerson) -> String {
        var face = ""
        
        switch person.gender {
        case "male":
            face = "👱🏻‍♂️"
        case "female":
            face = "👱🏻‍♀️"
        default:
            break
        }
        
        return face + person.name
    }
    
    override func prepareForReuse() {
        lblHomeWorld.text = ""
    }
}

extension SWCharCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.SWFilmCell.rawValue, for: indexPath)
            as? SWFilmCell else { return UICollectionViewCell() }
        
        if !films.isEmpty {
            cell.customInit(withFilm: films[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

//
//  SWFilmCell.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import UIKit

class SWFilmCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblEpisodeNum: UILabel!
    
    func customInit(withFilm film: SWFilm) {
        lblTitle.text = film.title
        lblEpisodeNum.text = "Episode: \(film.episodeId)"
    }
}

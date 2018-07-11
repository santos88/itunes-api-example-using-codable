//
//  SongTableViewCell.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    func configure(model:SongModel) {
        songLabel.text = model.trackName
        albumLabel.text = model.collectionName
        artistLabel.text = model.artistName
    }
    
    override func prepareForReuse() {
        songLabel.text = nil
        albumLabel.text = nil
        artistLabel.text = nil

    }
}

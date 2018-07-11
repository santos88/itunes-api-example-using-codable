//
//  ResultViewController.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumPhoto: UIImageView!
    
    var model:SongModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songLabel.text = model?.trackName
        albumLabel.text = model?.collectionName
        artistLabel.text = model?.artistName

        // Pending load image
    }

    @IBAction func playPreview(_ sender: Any) {
        // TODO
    }
    
}

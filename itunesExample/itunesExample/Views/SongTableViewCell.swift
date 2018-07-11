//
//  SongTableViewCell.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var imageDownloadTask = URLSessionTask()
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    func configure(model:SongModel) {
        songLabel.text = model.trackName
        albumLabel.text = model.collectionName
        artistLabel.text = model.artistName
        
        ImageDownloader().getImageFromWeb(downloadTask: &imageDownloadTask, urlString:model.artworkUrl100) {[weak self] (image) in
            DispatchQueue.main.async {
                self?.albumImage.image = image
            }
        }
    }
    
    override func prepareForReuse() {
        songLabel.text = nil
        albumLabel.text = nil
        artistLabel.text = nil
        albumImage.image = nil
        // The magic happens here :)
        // When the cell is going to be reused, the download task is cancelled to avoid troubles.
        imageDownloadTask.cancel()
    }
}

//
//  SearchController.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

class SearchController {
    
    var cache = [String : [SongModel]]()
    var lastSearch = [SongModel]()
    
    func searchSongs(keyword:String, completion: @escaping ([SongModel]?, Error?) -> Void) {
        if cache.keys.contains(keyword) {
            completion(cache[keyword], nil)
        }
            
        SongsAPI().searchSong(keyword: keyword) { [weak self] (songs, error) in
            if let songs = songs {
                self?.cache[keyword] = songs
                self?.lastSearch = songs
            }
            completion(songs, error)
        }
    }
    
    func cleanCache() {
        cache.removeAll()
    }
}

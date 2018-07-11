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
        // if the search was cached previously, we are returning the result
        if cache.keys.contains(keyword) {
            completion(cache[keyword], nil)
        }

        SongsAPI.shared.searchSong(keyword: keyword) { [weak self] (songs, error) in
            if let songs = songs {
                if songs.count > 0 {
                    // we are caching the results only if there are at least one result
                    self?.cache[keyword] = songs
                    self?.lastSearch = songs
                }
            }
            completion(songs, error)
        }
    }
    
    func cleanCache() {
        cache.removeAll()
    }
}

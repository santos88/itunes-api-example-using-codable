//
//  SongsAPI.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

// TODO
// The purpose of this APIProtocol is to be replaced/injected on the Unit Tests
// protocol APIProtocol {
//    func fetchAll(completion: @escaping ([Any]?, Error?) -> Void)
// }

class SongsAPI {
    
    static let shared = SongsAPI()
    
    var searchTask:URLSessionTask?
    
    func searchSong(keyword:String, completion: @escaping ([SongModel]?, Error?) -> Void) {
        // When a new search is triggered, we are cancelling previous searches
        // to improve performance.
        if searchTask?.state == URLSessionTask.State.running {
            searchTask?.cancel()
        }
        
        guard let searchUrl = generateSearchURL(keyword: keyword) else {
            //TODO improve error message
            return
        }
        
        let urlRequest = URLRequest(url: searchUrl)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        searchTask = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let parsedServerResponse = try decoder.decode(SongsServerResponse.self, from: data)
                completion(parsedServerResponse.results, nil)
            } catch let err {
                completion(nil, err)
            }
        }
        searchTask?.resume()
        
    }
    
    func generateSearchURL(keyword:String) -> URL? {
        let term = URLQueryItem(name: "term", value: keyword)
        let mediaType = URLQueryItem(name: "mediaType", value: "music")
        let limit = URLQueryItem(name: "limit", value: "20")
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/search"
        components.queryItems = [term, mediaType, limit]
        
        return components.url
    }

}

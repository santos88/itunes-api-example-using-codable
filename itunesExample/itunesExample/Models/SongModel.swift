//
//  MediaModel.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

struct SongModel:Codable, Equatable {
    var artworkUrl100:String?
    var collectionName:String?
    var artistName:String?
    var kind:String?
    var trackId:Int?
    
    static func ==(lhs: SongModel, rhs: SongModel) -> Bool {
        let areEqual = lhs.trackId == rhs.trackId
        return areEqual
    }
}

struct SongsServerResponse:Codable {
    var resultCount:Int?
    var results:[SongModel]
}

//
//  SongsAPITest.swift
//  itunesExampleTests
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import XCTest

class SongsAPITest: XCTestCase {
    
    // This is a basic test as a proof of concept.
    func testGenerateSearchURL() {
        let url = SongsAPI.shared.generateSearchURL(keyword: "Lagwagon")
        XCTAssertNotEqual(url?.absoluteString, "https://itunes.apple.com/search?term=Lagwagon")
        XCTAssertNotEqual(url?.absoluteString, "https://itunes.apple.com/search?term=Lagwagon&mediaType=music")
        XCTAssertEqual(url?.absoluteString, "https://itunes.apple.com/search?term=Lagwagon&mediaType=music&limit=20")
    }
    
}

//
//  ImageDownloader.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    // We are passing the URLSessionTask as a parameter to be able to cancel this task from outside if needed
    func getImageFromWeb(downloadTask:inout URLSessionTask, urlString: String?, closure: @escaping (UIImage?) -> ()) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return closure(nil)
        }
        downloadTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return closure(nil)
            }
            guard response != nil else {
                print("no response")
                return closure(nil)
            }
            guard data != nil else {
                print("no data")
                return closure(nil)
            }
            DispatchQueue.main.async {
                closure(UIImage(data: data!))
            }
        }
        downloadTask.resume()
    }

}

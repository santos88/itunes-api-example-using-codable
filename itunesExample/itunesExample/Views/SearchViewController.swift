//
//  SearchViewController.swift
//  itunesExample
//
//  Created by Santos Ramon on 10-07-18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var controller = SearchController()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchSongs(keyword: searchText)
    }
        
    func searchSongs(keyword:String) {
        controller.searchSongs(keyword: keyword) { [weak self] (songs, error) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.lastSearch.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        let model = controller.lastSearch[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }


}

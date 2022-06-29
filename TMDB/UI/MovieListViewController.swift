//
//  ViewController.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

class MovieListViewController: UIViewController, Storyboarded {
    static var storyboardName = StoryboardName.main
    var presenter: MovieListPresenter!
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Popular"
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        presenter?.loadMovies()
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.moviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")!
        cell.textLabel?.text = "Hello World"
        return cell
    }
}

extension MovieListViewController: MovieListingView {
    func reloadMoviesForDisplay() {
        moviesTableView.reloadData()
    }
}

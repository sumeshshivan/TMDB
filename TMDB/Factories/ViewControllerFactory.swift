//
//  ViewControllerFactory.swift
//  TMDB
//
//  Created by sumesh shivan on 17/03/22.
//

import UIKit

struct ViewControllerFactory {
    static func getPopularMoviesListVC() -> MovieListViewController {
        let movieListVC = MovieListViewController.instatiate()
        movieListVC.presenter = MovieListPresenter(
            filter: .popular,
            moviesProvider: PopularMoviesProvider(moviesApi: MoviesApi()),
            movieListingView: movieListVC)
        return movieListVC
    }
    
    static func getLatestMoviesListVC() -> MovieListViewController {
        let movieListVC = MovieListViewController.instatiate()
        movieListVC.presenter = MovieListPresenter(
            filter: .latest,
            moviesProvider: LatestMoviesProvider(moviesApi: MoviesApi()),
            movieListingView: movieListVC)
        return movieListVC
    }
}

//
//  MovieListPresenter.swift
//  TMDB
//
//  Created by sumesh shivan on 16/03/22.
//

import Foundation
import Combine

protocol MovieListingView: AnyObject {
    func reloadMoviesForDisplay()
}

class MovieListPresenter {
    enum MovieListFilter {
        case latest
        case popular
    }
    let filter: MovieListFilter
    let moviesProvider: MoviesProvider
    weak var movieListingView: MovieListingView?
    private var anyCancellable: AnyCancellable?
    private var movies: [Movie] = []
    
    init(filter: MovieListFilter, moviesProvider: MoviesProvider, movieListingView: MovieListingView?) {
        self.filter = filter
        self.moviesProvider = moviesProvider
        self.movieListingView = movieListingView
    }
    
    func loadMovies() {
        anyCancellable = moviesProvider.getMovies().sink(receiveCompletion: { (completion) in
            switch(completion) {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { moviesResponse in
            print(moviesResponse)
            self.movies = moviesResponse.results
            self.movieListingView?.reloadMoviesForDisplay()
        })
    }
    
    
    func moviesCount() -> Int {
        return movies.count
    }
    
    func movieAt(_ index: Int) -> Movie {
        return movies[index]
    }
}

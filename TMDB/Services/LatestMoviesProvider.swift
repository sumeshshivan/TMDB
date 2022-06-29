//
//  LatestMoviesProvider.swift
//  TMDB
//
//  Created by sumesh shivan on 16/03/22.
//

import Foundation
import Combine

class LatestMoviesProvider: MoviesProvider {
    let moviesApi: MoviesApi
    init(moviesApi: MoviesApi) {
        self.moviesApi = moviesApi
    }
    func getMovies() -> AnyPublisher<BasePaginatedResponse<[Movie]>, Error> {
        moviesApi.fetchMovies(sortBy: .releaseDate)
    }
}

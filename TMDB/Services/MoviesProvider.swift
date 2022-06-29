//
//  MoviesProvider.swift
//  TMDB
//
//  Created by sumesh shivan on 16/03/22.
//

import Foundation
import Combine

protocol MoviesProvider {
    func getMovies() -> AnyPublisher<BasePaginatedResponse<[Movie]>, Error>
}

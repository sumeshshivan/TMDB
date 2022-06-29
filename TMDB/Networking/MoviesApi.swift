//
//  IpasApi.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import Foundation
import Combine


class MoviesApi {
    private let httpClient: HTTPClient
    private let baseUrlProvider: BaseUrlProviding
    
    enum SortBy: String {
        case popularity = "popularity.des"
        case releaseDate = "release_date.des"
    }
    
    init(httpClient: HTTPClient = HTTPClient(), baseUrlProvider: BaseUrlProviding = BaseUrlProvider()) {
        self.httpClient = httpClient
        self.baseUrlProvider = baseUrlProvider
    }
    
    func fetchMovies(sortBy: SortBy) -> AnyPublisher<BasePaginatedResponse<[Movie]>, Error> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = baseUrlProvider.baseUrl.host
        urlComponents.path = "/3/discover/movie"
        urlComponents.queryItems = [
           URLQueryItem(name: "api_key", value: APIKeys.tmdbApiKey),
           URLQueryItem(name: "sort_by", value: sortBy.rawValue),
           URLQueryItem(name: "language", value: "en-US"),
           URLQueryItem(name: "include_adult", value: "false"),
           URLQueryItem(name: "include_video", value: "false"),
           URLQueryItem(name: "with_watch_monetization_types", value: "flatrate"),
           URLQueryItem(name: "page", value: "1")
        ]
        print(urlComponents.url?.absoluteString)
        let request =  URLRequest(url: urlComponents.url!)
        return httpClient.perform(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

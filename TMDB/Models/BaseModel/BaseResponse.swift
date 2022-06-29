//
//  BaseResponse.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import Foundation

struct BaseResponse<DataType: Decodable>: Decodable {
    var status: String
    var data: DataType?
}

struct BasePaginatedResponse<DataType: Decodable>: Decodable {
    var page: Int
    var results: DataType
    var totalPages: Int
    var totalResults: Int
}

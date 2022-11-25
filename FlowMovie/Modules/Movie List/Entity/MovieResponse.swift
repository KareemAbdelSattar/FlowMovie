//
//  MovieResponse.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//

import Foundation

struct MovieResponse: Codable {
    let page : Int?
    let results : [Movie]?
    let total_pages : Int?
    let total_results : Int?
}

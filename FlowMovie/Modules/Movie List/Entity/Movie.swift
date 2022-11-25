//
//  Movie.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//

import Foundation

struct Movie : Codable {
    let id : Int?
    let title : String?
    let poster_path : String?
    let release_date : String?
    let overview: String?
}

//
//  MovieDetailsResponse.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Foundation

struct MovieDetailsResponse: Codable {
    let adult : Bool?
    let backdrop_path : String?
    let budget : Int?
    let genres : [Genres]?
    let homepage : String?
    let id : Int?
    let imdb_id : String?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let release_date : String?
    let revenue : Int?
    let runtime : Int?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?

    var description: String {
        let categories = genres!.map { $0.name! }.joined(separator: ", ")
        return "\(release_date!) (\(original_language!.uppercased())) - \(categories) "
    }
    
    var rate: String {
        let voteInString = String(format: "%.1f", vote_average!)
        return "Rate: \(voteInString)/10"
    }
}

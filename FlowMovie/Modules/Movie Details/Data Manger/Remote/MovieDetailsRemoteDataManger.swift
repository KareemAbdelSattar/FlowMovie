//
//  MovieDetailsRemoteDataManger.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Foundation

class MovieDetailsRemoteDataManger: MovieDetailsRemoteDataMangerProtocol {
    var interactor: MovieDetailsInteractorProtocol?
    
    func getMovieDetails(movieId: Int) {
        NetworkService.shared.fetch(userRouter: MovieRouter.movieDetails(movieId: movieId)) { (result: Result<MovieDetailsResponse?, NetworkError>) in
            switch result {
            case .success(let movieDetails):
                if let movieDetails = movieDetails {
                    self.interactor?.onRetriveMovieDetails(movieDetails: movieDetails)
                } else {
                    self.interactor?.onErrorRetriveMovieDetails(error: .dataIsNil)
                }
            case .failure(let error):
                self.interactor?.onErrorRetriveMovieDetails(error: error)
                
            }
        }
    }
}

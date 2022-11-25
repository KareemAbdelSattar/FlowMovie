//
//  MovieDetailsInteractor.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    var remoteDataManger: MovieDetailsRemoteDataMangerProtocol?
    var presenter: MovieDetailsPresenterProtocol?

    func fetchMovieDetails(movieId: Int) {
        remoteDataManger?.getMovieDetails(movieId: movieId)
    }
    
    func onRetriveMovieDetails(movieDetails: MovieDetailsResponse) {
        presenter?.didRetriveMovieDetails(movieDetials: movieDetails)
    }
    
    func onErrorRetriveMovieDetails(error: NetworkError) {
        let errorMsg = ErrorHandling().checkForError(with: error)
        presenter?.didRetriveError(errorMsg: errorMsg)
    }
}

//
//  MovieDetailsInteractor.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsInteractorProtocol {
    var presenter: MovieDetailsPresenterProtocol? { get set }
    var remoteDataManger: MovieDetailsRemoteDataMangerProtocol? { get set }
    func fetchMovieDetails(movieId: Int)
    func onRetriveMovieDetails(movieDetails: MovieDetailsResponse)
    func onErrorRetriveMovieDetails(error: NetworkError)
}

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
        presenter?.didRetriveError(error: error)
    }
    
}

//
//  MovieListInteractor.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    var remoteDataManger: MovieListRemoteDataMangerProtocol? { get set }
    func fetchPopularMovies(page: Int)
    func onRetrivePopularMovies(movieResponse: MovieResponse)
    func onErrorRetriveMovies(error: NetworkError)
}

class MovieListInteractor: MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol?
    var remoteDataManger: MovieListRemoteDataMangerProtocol?
    
    func fetchPopularMovies(page: Int) {
        remoteDataManger?.getPopularMovies(page: page)
    }
    
    func onRetrivePopularMovies(movieResponse: MovieResponse) {
        if movieResponse.page == 1 && movieResponse.results!.isEmpty {
            presenter?.didRetriveError(error: .emptyResult)
        } else {
            presenter?.didRetrivePopularMovies(movieResponse: movieResponse)
        }
    }
    
    func onErrorRetriveMovies(error: NetworkError) {
        presenter?.didRetriveError(error: error)
    }
}

//
//  MovieListInteractor.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MovieListInteractor: MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol?
    var remoteDataManger: MovieListRemoteDataMangerProtocol?
    private let errorHandling = ErrorHandling()
    
    func fetchPopularMovies(page: Int) {
        remoteDataManger?.getPopularMovies(page: page)
    }
    
    func onRetrivePopularMovies(movieResponse: MovieResponse) {
        if movieResponse.page == 1 && movieResponse.results!.isEmpty {
            let errorMsg = errorHandling.checkForError(with: .dataIsNil)
            presenter?.didRetriveError(errorMsg: errorMsg)
        } else {
            presenter?.didRetrivePopularMovies(movieResponse: movieResponse)
        }
    }
    
    func onErrorRetriveMovies(error: NetworkError) {
        let errorMsg = errorHandling.checkForError(with: error)
        presenter?.didRetriveError(errorMsg: errorMsg)
    }
}

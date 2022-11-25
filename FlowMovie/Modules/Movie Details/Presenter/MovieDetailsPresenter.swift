//
//  MovieDetailsPresenter.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation


protocol MovieDetailsPresenterProtocol: AnyObject {
    var view: MovieDetailsViewProtocol? { get set }
    var interactor: MovieDetailsInteractorProtocol? { get set }
    var router: MovieDetailsRouterProtocol? { get set }
    func viewDidLoad()
    func didRetriveMovieDetails(movieDetials: MovieDetailsResponse)
    func didRetriveError(error: NetworkError)
}

class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    weak var view: MovieDetailsViewProtocol?
    var interactor: MovieDetailsInteractorProtocol?
    var router: MovieDetailsRouterProtocol?
    
    private let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func viewDidLoad() {
        view?.showIndicator()
        interactor?.fetchMovieDetails(movieId: movieId)
    }
    
    func didRetriveMovieDetails(movieDetials: MovieDetailsResponse) {
        view?.updateMovieDetailsUI(movieDetails: movieDetials)
        view?.hideIndicator()
    }
    
    func didRetriveError(error: NetworkError) {
        print(error)
    }
}


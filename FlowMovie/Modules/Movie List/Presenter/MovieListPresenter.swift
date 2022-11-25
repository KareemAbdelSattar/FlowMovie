//
//  MovieListPresenter.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation


protocol MovieListPresenterProtocol: AnyObject {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
    func viewDidLoad()
    func getPopularMovies()
    func didRetrivePopularMovies(movieResponse: MovieResponse)
    func didRetriveError(error: NetworkError)
    func presentMovieDetails(movieId: Int)
}

class MovieListPresenter: MovieListPresenterProtocol {
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?
    private var page = 1
    
    func viewDidLoad() {
        getPopularMovies()
    }
    
    func getPopularMovies() {
        view?.showIndicator()
        interactor?.fetchPopularMovies(page: page)
    }
    
    func didRetrivePopularMovies(movieResponse: MovieResponse) {
        view?.showPopularMovies(movies: movieResponse.results ?? [])
        view?.hideIndicator()
        view?.reloadMovies()
        page = (page + 1 <= movieResponse.total_pages ?? 1) ? (movieResponse.page ?? 1) + 1 : 1
    }
    
    func didRetriveError(error: NetworkError) {
        switch error {
        case .noConnection:
            view?.showError(errorMsg: "No internet connection")
        case .failed:
            view?.showError(errorMsg: "Can't decode the data")
        case .dataIsNil:
            view?.showError(errorMsg: "Data is empty")
        case .notAuthentication:
            view?.showError(errorMsg: "Not authentication")
        case .invalidResponse:
            view?.showError(errorMsg: "Invalid response")
        case .emptyResult:
            view?.showError(errorMsg: "No popular movies")
        }
    }
    
    func presentMovieDetails(movieId: Int) {
        router?.presentMovieDetails(movieId: movieId)
    }
}

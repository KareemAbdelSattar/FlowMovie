//
//  MovieListPresenter.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

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
    
    func didRetriveError(errorMsg: String){
        view?.showError(errorMsg: errorMsg)
    }
    
    func presentMovieDetails(movieId: Int) {
        router?.presentMovieDetails(movieId: movieId)
    }
}

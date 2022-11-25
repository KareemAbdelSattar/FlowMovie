//
//  MovieListProtocol.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Foundation

protocol MovieListViewProtocol: AnyObject {
    var presenter: MovieListPresenterProtocol? { get set }
    func showIndicator()
    func hideIndicator()
    func reloadMovies()
    func showPopularMovies(movies: [Movie])
    func showError(errorMsg: String)
}

protocol MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    var remoteDataManger: MovieListRemoteDataMangerProtocol? { get set }
    func fetchPopularMovies(page: Int)
    func onRetrivePopularMovies(movieResponse: MovieResponse)
    func onErrorRetriveMovies(error: NetworkError)
}

protocol MovieListPresenterProtocol: AnyObject {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
    func viewDidLoad()
    func getPopularMovies()
    func didRetrivePopularMovies(movieResponse: MovieResponse)
    func didRetriveError(errorMsg: String)
    func presentMovieDetails(movieId: Int)
}

protocol MovieListRemoteDataMangerProtocol: AnyObject {
    var interactor: MovieListInteractorProtocol? { get set }
    func getPopularMovies(page: Int)
}

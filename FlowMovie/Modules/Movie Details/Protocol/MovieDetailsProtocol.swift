//
//  MovieDetailsProtocol.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Foundation

protocol MovieDetailsViewProtocol: AnyObject {
    var presenter: MovieDetailsPresenterProtocol? { get set }
    func showIndicator()
    func hideIndicator()
    func updateMovieDetailsUI(movieDetails: MovieDetailsResponse)
    func showError(errorMsg: String)
}

protocol MovieDetailsInteractorProtocol {
    var presenter: MovieDetailsPresenterProtocol? { get set }
    var remoteDataManger: MovieDetailsRemoteDataMangerProtocol? { get set }
    func fetchMovieDetails(movieId: Int)
    func onRetriveMovieDetails(movieDetails: MovieDetailsResponse)
    func onErrorRetriveMovieDetails(error: NetworkError)
}

protocol MovieDetailsPresenterProtocol: AnyObject {
    var view: MovieDetailsViewProtocol? { get set }
    var interactor: MovieDetailsInteractorProtocol? { get set }
    var router: MovieDetailsRouterProtocol? { get set }
    func viewDidLoad()
    func didRetriveMovieDetails(movieDetials: MovieDetailsResponse)
    func didRetriveError(errorMsg: String)
}

protocol MovieDetailsRemoteDataMangerProtocol: AnyObject {
    var interactor: MovieDetailsInteractorProtocol? { get set }
    func getMovieDetails(movieId: Int)
}

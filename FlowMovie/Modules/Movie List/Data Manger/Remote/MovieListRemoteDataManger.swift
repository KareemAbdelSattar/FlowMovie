//
//  MovieListRemoteDataManger.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Alamofire

protocol MovieListRemoteDataMangerProtocol: AnyObject {
    var interactor: MovieListInteractorProtocol? { get set }
    func getPopularMovies(page: Int)
}

class MovieListRemoteDataManger: MovieListRemoteDataMangerProtocol {
    var interactor: MovieListInteractorProtocol?
    
    func getPopularMovies(page: Int) {
        NetworkService.shared.fetch(userRouter: MovieRouter.popularMovies(page: page)) {  (result: Result<MovieResponse?, NetworkError>) in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    self.interactor?.onRetrivePopularMovies(movieResponse: movies)
                } else {
                    self.interactor?.onErrorRetriveMovies(error: .dataIsNil)
                }
            case .failure(let error):
                self.interactor?.onErrorRetriveMovies(error: error)

            }
        }
    }
}

//
//  MovieListRouter.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieListRouterProtocol: AnyObject {
    static func start() -> UIViewController
    var viewController: UIViewController? { get set }
    func presentMovieDetails(movieId: Int)
}

class MovieListRouter: MovieListRouterProtocol {
    var viewController: UIViewController?
    
    static func start() -> UIViewController {
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListVC") as? MovieListVC {
            
            let nv = UINavigationController(rootViewController: view)
            let router = MovieListRouter()
            let interactor = MovieListInteractor()
            let presenter = MovieListPresenter()
            let remoteManger = MovieListRemoteDataManger()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            interactor.remoteDataManger = remoteManger
            remoteManger.interactor = interactor
            router.viewController = view
            return nv
        }
        return UIViewController()
    }
    
    func presentMovieDetails(movieId: Int) {
        let movieDetailsVC = MovieDetailsRouter.start(movieId: movieId)
        if let sourceView = viewController as? MovieListVC {
            sourceView.fadeInAnimation()
            movieDetailsVC.modalPresentationStyle = .overFullScreen
            movieDetailsVC.modalTransitionStyle = .crossDissolve
            sourceView.navigationController?.present(movieDetailsVC, animated: true)
        }
    }
}


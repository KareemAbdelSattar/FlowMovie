//
//  MovieDetailsRouter.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsRouterProtocol: AnyObject {
    static func start(movieId: Int) -> UIViewController
    var viewController: UIViewController? { get set }
}

class MovieDetailsRouter: MovieDetailsRouterProtocol {
    var viewController: UIViewController?
        
    static func start(movieId: Int) -> UIViewController {
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC {
            
            let router = MovieDetailsRouter()
            let interactor = MovieDetailsInteractor()
            let presenter = MovieDetailsPresenter(movieId: movieId)
            let remoteData = MovieDetailsRemoteDataManger()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.remoteDataManger = remoteData
            interactor.presenter = presenter
            remoteData.interactor = interactor
            router.viewController = view
            return view
        }
        return UIViewController()
    }
}


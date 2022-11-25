//
//  MovieListVC.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieListViewProtocol: AnyObject {
    var presenter: MovieListPresenterProtocol? { get set }
    func showIndicator()
    func hideIndicator()
    func reloadMovies()
    func showPopularMovies(movies: [Movie])
    func showError(errorMsg: String)
}

class MovieListVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var presenter: MovieListPresenterProtocol?
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureNavigationController()
        presenter?.viewDidLoad()
    }
    
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        collectionView.collectionViewLayout = UIHelper.createProductCompositionalLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureNavigationController() {
//        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.main_bg!]
//        navigationController?.navigationBar.setColors(background: UIColor.main_bg!, text: UIColor.systemBackground)
        title = "Movies"
    }
}

extension MovieListVC: MovieListViewProtocol {
    func showPopularMovies(movies: [Movie]) {
        self.movies.append(contentsOf: movies)
    }
    
    func reloadMovies() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func showIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.startAnimating()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.stopAnimating()
            self?.loadingView.hidesWhenStopped = true
        }
    }
    
    func showError(errorMsg: String) {
        let alerViewController = UIAlertController(title: "Warning", message: errorMsg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alerViewController.addAction(cancelAction)
        self.present(alerViewController, animated: true)
    }
}

extension MovieListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1{
            presenter?.getPopularMovies()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieId = movies[indexPath.row].id else { return }
        presenter?.presentMovieDetails(movieId: movieId)
    }
}

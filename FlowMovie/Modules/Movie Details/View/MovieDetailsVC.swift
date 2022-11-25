//
//  MovieDetailsVC.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    var presenter: MovieDetailsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDialogViewUI()
        presenter?.viewDidLoad()
    }
    
    func configureDialogViewUI() {
        dialogView.layer.cornerRadius = 20
        posterImageView.layer.masksToBounds = true
        posterImageView.layer.cornerRadius = 20
        posterImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension MovieDetailsVC: MovieDetailsViewProtocol {
    func showIndicator() {
        loadingView.startAnimating()
    }
    
    func hideIndicator() {
        loadingView.stopAnimating()
        loadingView.hidesWhenStopped = true
    }
 
    func updateMovieDetailsUI(movieDetails: MovieDetailsResponse){
        let url = URL(string: Constant.imageBaseURL + movieDetails.poster_path!)!
        posterImageView.kf.setImage(with: url)
        titleLabel.text = movieDetails.title
        descriptionLabel.text = movieDetails.description
        overviewLabel.text = movieDetails.overview
        tagLineLabel.text = movieDetails.tagline
        rateLabel.text = movieDetails.rate
    }
    
    func showError(errorMsg: String) {
        self.showAlertView(with: errorMsg)
    }
}

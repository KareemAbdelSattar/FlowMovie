//
//  MovieCell.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var bgShadowImageView: UIImageView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var filmLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
   
    var movie: Movie? {
        didSet {
            let imageURL = URL(string: Constant.imageBaseURL + (movie?.poster_path)!)
            posterImageView.kf.setImage(with: imageURL)
            bgShadowImageView.kf.setImage(with: imageURL)
            filmLabel.text = movie?.title
            releaseDataLabel.text = movie?.release_date
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    func configureCell() {
        self.imageContainerView.layer.cornerRadius = 15
        self.bgShadowImageView.layer.cornerRadius = 15
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = true
    }
    
    
}

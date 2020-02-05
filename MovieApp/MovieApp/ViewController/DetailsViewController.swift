//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Anika Tomichen on 05/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailPosterImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailRatingLabel: UILabel!
    
    @IBOutlet weak var detailDescTextField: UITextView!
    
    var movieDetail: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        updateUI()
    }
    
    func updateUI(){
        if let movieDetails:Results = movieDetail{
            detailTitleLabel.text = movieDetails.title
            detailRatingLabel.text = String(format: "%d", movieDetails.vote_average ?? 0)
            detailDescTextField.text = movieDetails.overview
            detailPosterImageView.sd_setImage(with: URL(string: Utils.getDetailPosterImageURL(from: movieDetails.poster_path ?? "") ?? ""), placeholderImage: UIImage(named: "splash1"))
        }
    }

}

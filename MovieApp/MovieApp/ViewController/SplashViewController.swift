//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var loadingCommentLabel: UILabel!
    
    @IBOutlet weak var splashImageView: UIImageView!
    
    let responseBuilder: ResponseBuilder = ResponseBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashImageView.animationImages = Utils.getSplashAnimationImageList()
        splashImageView.animationDuration = 2.0
        splashImageView.startAnimating()
        updateUI()
    }
    
    func updateUI(){
            weak var wself = self
            wself?.responseBuilder.saveConfigurationData(){(status) in
                if status{
                    wself?.loadingCommentLabel.text = "Loading...."
                }else{
                    wself?.loadingCommentLabel.text = "check network connection"
                }
            }
            
            if let nowPlayingMovieList:NowPlayingModal = wself?.responseBuilder.getNowPlayingMoviesData(){
                wself?.loadingCommentLabel.text = "still Loading...."
                //also pass data to next view
                
            }else{
                wself?.loadingCommentLabel.text = "check network connection"
            }

    }

}

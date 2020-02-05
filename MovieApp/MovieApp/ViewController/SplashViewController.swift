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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
                    wself?.responseBuilder.getNowPlayingMoviesData(){(movieList, status) in
                        if let nowPlayingList:NowPlayingModal = movieList, status{
                            //also pass data to next view
                            wself?.setNavigationController(with: nowPlayingList)
                        }
                    }
                }else{
                    wself?.loadingCommentLabel.text = "check network connection"
                }
            }
    }
    
    func setNavigationController(with movieList:NowPlayingModal){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let homeViewController:HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.movieList = movieList
        self.navigationController?.pushViewController(homeViewController, animated: false)
        
        
    }

}

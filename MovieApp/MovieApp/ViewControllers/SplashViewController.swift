//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var splashImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashImageView.image = UIImage(named: "splash1")
//        if let imageList: [UIImage] = Utils.getSplashAnimationImageList(){
//        splashImageView.animationImages = imageList
//        }

    }

}

//
//  NavigationManager.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class NavigationManager: NSObject {
    
    class func setViewController(for page:PageType) -> UIViewController{
        var viewController:UIViewController = UIViewController()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        switch page {
        case .SplashView:
            viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            
        case .HomeView:
            viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
        case .DetailView:
            viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            
        }
        return viewController
    }
    
   

}

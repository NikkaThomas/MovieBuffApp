//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movieList: NowPlayingModal?
    let homeCollectionViewDelegate:HomeCollectionDelegate = HomeCollectionDelegate()
    let homeCollectionViewDataSource:HomeCollectionDataSource = HomeCollectionDataSource()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUI()
        registerCells()
        setDelegates()
        
    }
    
    func setDelegates(){
        moviesCollectionView.dataSource = homeCollectionViewDataSource
        moviesCollectionView.delegate = homeCollectionViewDelegate
        homeCollectionViewDelegate.cellDelegate = self
        moviesCollectionView.reloadData()
    }
    
    func registerCells(){
        let cellNib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        moviesCollectionView.register(cellNib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    func updateUI(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        homeCollectionViewDataSource.movieList = movieList
        homeCollectionViewDelegate.movieList = movieList
    }
    
}

extension HomeViewController: cellDidSelectDelegate{
    
    func movieClicked(with data:  Results?){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController:DetailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
         detailViewController.movieDetail = data
        self.navigationController?.pushViewController(detailViewController, animated: false)
    
    }

}

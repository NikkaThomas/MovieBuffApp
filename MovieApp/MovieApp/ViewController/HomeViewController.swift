//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sortByButton: UIButton!
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
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

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
        homeCollectionViewDataSource.movieList = movieList
        homeCollectionViewDelegate.movieList = movieList
    }
    
    
    @IBAction func sortByButtonPressed(_ sender: Any) {
        guard let movieDetailList:NowPlayingModal = movieList, let resultList = movieDetailList.results else {
            return
        }
        let sortList:[String] = ["Most popular", "Best Rating"]
        let alertController = UIAlertController(title: nil, message: "Sort By", preferredStyle: .actionSheet)
        for sortValue in sortList{
            let sortAction = UIAlertAction(title: sortValue, style: .default, handler: { (alert: UIAlertAction!) -> Void in
                if sortValue == "Most popular"{
                    self.movieList?.results = Utils.sortData(with: .mostPopular, from: resultList)
                    self.updateUI()
                    self.moviesCollectionView.reloadData()
                    
                }else{
                    self.movieList?.results = Utils.sortData(with: .mostRating, from: resultList)
                    self.updateUI()
                    self.moviesCollectionView.reloadData()

                }
                print(sortValue)
            })
            alertController.addAction(sortAction)
        }

        self.present(alertController, animated: true, completion: nil)
        
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

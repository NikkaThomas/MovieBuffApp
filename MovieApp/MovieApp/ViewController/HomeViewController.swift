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
    var paginationBusy:Bool = false
    var currentPage:Int = 1
    let homeCollectionViewDelegate:HomeCollectionDelegate = HomeCollectionDelegate()
    let homeCollectionViewDataSource:HomeCollectionDataSource = HomeCollectionDataSource()
    let responseBuilder: ResponseBuilder = ResponseBuilder()
    let kHomeCustomCell:String = "HomeCollectionViewCell"
    
    
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
        let cellNib = UINib(nibName: kHomeCustomCell, bundle: nil)
        moviesCollectionView.register(cellNib, forCellWithReuseIdentifier: kHomeCustomCell)
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
            })
            alertController.addAction(sortAction)
        }

        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

extension HomeViewController: cellDidSelectDelegate{
    
    func movieClicked(with data:  Results?){
        
        let detailViewController:DetailsViewController = NavigationManager.setViewController(for: .DetailView) as! DetailsViewController
         detailViewController.movieDetail = data
        self.navigationController?.pushViewController(detailViewController, animated: false)
    
    }
    
    func pagination(){
        if !paginationBusy && movieList?.total_pages ?? 0 >= currentPage{
            paginationBusy = true
        self.responseBuilder.getNowPlayingMoviesData(at: currentPage + 1){(movieList, status) in
            weak var wself = self
            if let newMovieList:NowPlayingModal = movieList, let resultArray = newMovieList.results{
                for newMovies in resultArray{
                    wself?.movieList?.results?.append(newMovies)
                }
                wself?.updateUI()
                wself?.moviesCollectionView.reloadData()
                wself?.currentPage = (wself?.currentPage ?? 1) + 1
                wself?.paginationBusy = false
            }
        }
        }

    }

}

//
//  HomeCollectionDataSource.swift
//  MovieApp
//
//  Created by Anika Tomichen on 05/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit
import SDWebImage


class HomeCollectionDataSource: NSObject, UICollectionViewDataSource {
    var movieList: NowPlayingModal?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let nowPlayingMovies = movieList{
            return nowPlayingMovies.results?.count ?? 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        if let nowPlayingMovies = movieList{
            cell.titleLabel.text = nowPlayingMovies.results?[indexPath.row].title
            cell.posterImageView.sd_setImage(with: URL(string: Utils.getPosterImageURL(from: nowPlayingMovies.results?[indexPath.row].poster_path ?? "") ?? ""), placeholderImage: UIImage(named: "splash1"))
        }
        
        return cell
        
    }
    

}

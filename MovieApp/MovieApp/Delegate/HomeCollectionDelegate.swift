//
//  HomeCollectionDelegate.swift
//  MovieApp
//
//  Created by Anika Tomichen on 05/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

protocol cellDidSelectDelegate {
    func movieClicked(with data:  Results?)
    func pagination()
}

class HomeCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    var movieList: NowPlayingModal?
    var cellDelegate: cellDidSelectDelegate?
    
    var interLineSpace:CGFloat = 10.0
    var interItemSpace:CGFloat = 10.0
    var cellEdgeInset: UIEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let movieDetailList: NowPlayingModal = movieList{
            cellDelegate?.movieClicked(with: movieDetailList.results?[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth:CGFloat = collectionView.frame.width - (2*interItemSpace) - cellEdgeInset.left - cellEdgeInset.right
        return CGSize(width: cellWidth, height: 92.0 + 5 + 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return interLineSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return interItemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return cellEdgeInset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height - 60 {
            cellDelegate?.pagination()            
        }
    }
    

}

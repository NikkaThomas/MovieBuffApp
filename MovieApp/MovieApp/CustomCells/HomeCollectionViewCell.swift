//
//  CollectionViewCell.swift
//  MovieApp
//
//  Created by Anika Tomichen on 05/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCellDesign()
    }
    
    func updateCellDesign(){
        baseView.layer.cornerRadius = 20.0
        posterImageView.layer.cornerRadius = 10.0
    }

}

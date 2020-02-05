//
//  Utils.swift
//  MovieApp
//
//  Created by Anika Tomichen on 03/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class Utils: NSObject {

    class func getSplashAnimationImageList() -> [UIImage]{
        var imagesList : [UIImage] = []
                          
          for index in 1...11 {
             let imageName = "splash" + String(index)
              let image = UIImage.init(named: imageName)!
              imagesList.append(image)
          }
        return imagesList
    }
    
    class func getPosterImageURL(from path:String) -> String?{
        let baseUrl = SharedManager.shared.getBaseUrl() ?? ""
        let posterSize = SharedManager.shared.getPosterImageSizes()?[0] ?? ""
        let fullPath: String = baseUrl + "/" + posterSize + path
        return fullPath
    }
    
    class func getDetailPosterImageURL(from path:String) -> String?{
        let baseUrl = SharedManager.shared.getBaseUrl() ?? ""
        let posterSize = SharedManager.shared.getPosterImageSizes()?[1] ?? ""
        let fullPath: String = baseUrl + "/" + posterSize + path
        return fullPath
    }
    
    
}

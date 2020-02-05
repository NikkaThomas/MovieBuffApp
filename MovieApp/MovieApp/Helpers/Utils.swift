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
        var posterSize = ""
        if Utils.isIPad(){
            posterSize = SharedManager.shared.getPosterImageSizes()?[2] ?? ""
        }else{
            posterSize = SharedManager.shared.getPosterImageSizes()?[1] ?? ""
        }
        
        let fullPath: String = baseUrl + "/" + posterSize + path
        return fullPath
    }
    
    class func sortData(with option:SortOptions, from data:[Results]) ->[Results]?{
        var sortedList:[Results]? = nil
        if option == .mostPopular{
            sortedList = data.sorted(by: { $0.popularity ?? 0.0 > $1.popularity ?? 0.0})
        }else{
            sortedList = data.sorted(by: { $0.vote_average ?? 0.0 > $1.vote_average ?? 0.0})
        }
        return sortedList
    }
    
    class func isIPad() -> Bool{
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        return false
    case .pad:
        return true
    case .unspecified:
        return false
    default:
        return false
    }
    }
    
}

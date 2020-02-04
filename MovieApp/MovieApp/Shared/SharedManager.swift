//
//  SharedManager.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class SharedManager {
    //remove the unwanted code from here
    static let shared = SharedManager()
    var configurationData:ConfigurationModal?
    private init(){}

    func saveEndPoints(with configValues:ConfigurationModal){
        self.configurationData = configValues
    }
    
    func getSavedEndPoints() -> ConfigurationModal?{
        return configurationData
    }
    
    func getBaseUrl() -> String?{
        return configurationData?.images?.base_url
    }
    
    func getBackDropImageSizes() -> [String]?{
        return configurationData?.images?.backdrop_sizes
    }
    
    func getLogoImageSizes() -> [String]?{
        return configurationData?.images?.logo_sizes
    }
    
    func getPosterImageSizes() -> [String]?{
        return configurationData?.images?.poster_sizes
    }
    
    func getProfileImageSizes() -> [String]?{
        return configurationData?.images?.profile_sizes
    }
    
    func getStillSizes() -> [String]?{
        return configurationData?.images?.still_sizes
    }
}

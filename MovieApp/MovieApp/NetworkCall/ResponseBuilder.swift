//
//  ResponseBuilder.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class ResponseBuilder: NSObject {

    func getNowPlayingMoviesData() -> NowPlayingModal?{
        
        let networkCallTrial = APINetworkCallManager()
        var nowPlayingData:NowPlayingModal?
        networkCallTrial.getApiResponse(for: .nowPlaying){data, error in
            
            let decoder = JSONDecoder()
            
            if let data = data,
                let responseObject = (try? JSONSerialization.jsonObject(with: data)),
                let jsonData = try? JSONSerialization.data(withJSONObject:responseObject),
                let movieResponseData = try? decoder.decode(NowPlayingModal.self, from: jsonData){
                nowPlayingData = movieResponseData
            }
        }
        return nowPlayingData
    }
    
    func saveConfigurationData(onCompletion: @escaping (Bool) -> Void){
        let networkCallTrial = APINetworkCallManager()
        networkCallTrial.getApiResponse(for: .configuration){data, error in
    
        let decoder = JSONDecoder()
        if let data = data,
            let responseObject = (try? JSONSerialization.jsonObject(with: data)),
            let jsonData = try? JSONSerialization.data(withJSONObject:responseObject),
                let configurationResponseData = try? decoder.decode(ConfigurationModal.self, from: jsonData){
            SharedManager.shared.saveEndPoints(with: configurationResponseData)
            DispatchQueue.main.async(execute: {() -> Void in
            onCompletion(true)
            })
            }
        else{
            DispatchQueue.main.async(execute: {() -> Void in
            onCompletion(false)
            })
            }
        }
    }
}

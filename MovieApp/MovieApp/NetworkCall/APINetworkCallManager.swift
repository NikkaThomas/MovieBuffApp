//
//  APINetworkCallManager.swift
//  MovieApp
//
//  Created by Anika Tomichen on 03/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

enum NetworkCallType:Int {
    case nowPlaying
    case configuration
}

class APINetworkCallManager: NSObject {

    func getApiResponse(for callType:NetworkCallType, completion: @escaping (Data?, Error?) -> Void){
        let request = setRequestData(for: callType)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
            let response = response as? HTTPURLResponse,
            (200 ..< 300) ~= response.statusCode,
            error == nil else {
                completion(nil, error)
                return
        }
            completion(data, error)
        
    }
        task.resume()
    }
    
    func setRequestData(for callType:NetworkCallType) -> URLRequest{
        let urlComponents:URLComponents = URLComponents(string: endpoint)!
        
        if callType == .nowPlaying{
        let request = RequestBuilder.setNowPlayingRequest(with: urlComponents)
            return request
        }
            
        else {
        let request = RequestBuilder.setConfigurationRequest(with: urlComponents)
            return request
        }
        
    }
    
    func setResponseData(for callType:NetworkCallType){
        
    }
    
}

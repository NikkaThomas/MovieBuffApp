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
    
    let requestBuilder:RequestBuilder = RequestBuilder()

    func getApiResponse(for callType:NetworkCallType, with pageNumber: Int? = nil, completion: @escaping (Data?, Error?) -> Void){
        let request = setRequestData(for: callType, with: pageNumber)
        
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
    
    func setRequestData(for callType:NetworkCallType, with pageNumber: Int? = nil) -> URLRequest{
        let urlComponents:URLComponents = URLComponents(string: endpoint)!
        
        if callType == .nowPlaying{
        let request = requestBuilder.setNowPlayingRequest(with: urlComponents, and: pageNumber)
            return request
        }
            
        else {
        let request = requestBuilder.setConfigurationRequest(with: urlComponents)
            return request
        }
        
    }
    
    func setResponseData(for callType:NetworkCallType){
        
    }
    
}

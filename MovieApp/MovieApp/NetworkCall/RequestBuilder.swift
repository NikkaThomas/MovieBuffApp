//
//  RequestBuilder.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class RequestBuilder: NSObject {
    func setNowPlayingRequest(with urlComponents:URLComponents, and pageNumber:Int? = nil) ->URLRequest{
        var urlComponent:URLComponents = urlComponents
       urlComponent.path = nowPlayinDataEndPoint
        let pageNumberString:String = String(format: "%d", pageNumber ?? 1)
        urlComponent.queryItems = [
          URLQueryItem(name: "api_key", value: kApiKey),
          URLQueryItem(name: "language", value: kDefaultLanguage),
          URLQueryItem(name: "page", value: pageNumberString),
          URLQueryItem(name: "region", value: defaultPlaceName)
        ]
        let request = URLRequest(url: (urlComponent.url)!)
        return request
    }
    
    func setConfigurationRequest(with urlComponents:URLComponents) ->URLRequest{
        
        var urlComponent:URLComponents = urlComponents
        urlComponent.path = imageConfigDataEndPoint

         urlComponent.queryItems = [
           URLQueryItem(name: "api_key", value: kApiKey)
         ]
         let request = URLRequest(url: (urlComponent.url)!)
         return request
        
    }

}

//
//  APINetworkCallManager.swift
//  MovieApp
//
//  Created by Anika Tomichen on 03/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class APINetworkCallManager: NSObject {

    func getNowPlayingApi(){
        var urlComponents:URLComponents = URLComponents(string: endpoint)!
        urlComponents.path = nowPlayinDataEndPoint

        urlComponents.queryItems = [
          URLQueryItem(name: "api_key", value: kApiKey),
          URLQueryItem(name: "language", value: kDefaultLanguage),
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "region", value: defaultPlaceName)
        ]
        let request = URLRequest(url: (urlComponents.url)!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
            let response = response as? HTTPURLResponse,
            (200 ..< 300) ~= response.statusCode,
            error == nil else {                           
                return
        }
        let decoder = JSONDecoder()

        if let responseObject = (try? JSONSerialization.jsonObject(with: data)),
            let jsonData = try? JSONSerialization.data(withJSONObject:responseObject),
                let movieResponseData = try? decoder.decode(NowPlayingModal.self, from: jsonData){
            
//            print(movieResponseData)
            }
        
        
    }
        task.resume()
    }
    
}

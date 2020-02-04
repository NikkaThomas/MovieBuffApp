//
//  Modals.swift
//  MovieApp
//
//  Created by Anika Tomichen on 04/02/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import Foundation

struct Results: Codable{
    var popularity: Float?
    var title:String?
    var overview: String?
    var poster_path: String?
    var vote_average: Float?
    var release_date: String?
    var genre_ids: [Int]?
    var vote_count: Int?
    var video: Bool?
    var id:Int?
    var adult:Bool?
    var backdrop_path:String?
    var original_language:String?
    var original_title:String?
    
    
}

struct Dates: Codable{
    var maximum: String?
    var minimum: String?
}

struct NowPlayingModal: Codable{
    var results: [Results]?
    var dates: Dates?
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
}

struct ConfigurationModal: Codable{
    var images:ImageEndPointsModal?
}

struct ImageEndPointsModal: Codable{
    var base_url:String?
    var secure_base_url:String?
    var backdrop_sizes:[String]?
    var logo_sizes:[String]?
    var poster_sizes:[String]?
    var profile_sizes:[String]?
    var still_sizes:[String]?
}

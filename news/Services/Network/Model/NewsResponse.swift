//
//  NewsResponse.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import Foundation

struct NewsResponse: Decodable {
    var news: [News]
    var success: Bool
    
    enum CodingKeys: String, CodingKey {
        case news = "result"
        case success
    }
}

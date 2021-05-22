//
//  News.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import Foundation

struct News: Decodable {
    var title: String?
    var description: String?
    var imageUrl: String?
    var sourceUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case description
        case imageUrl = "image"
        case sourceUrl = "url"
    }
}

//
//  CollectionViewCells.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 22.05.2021.
//

import Foundation

enum CollectionViewCells: Int {
    case category
    
    var name: String {
        switch self {
        case .category:
            return "CategoryCollectionViewCell"
        }
    }
    
    var id: String {
        return "\(self.name)ID"
    }
}

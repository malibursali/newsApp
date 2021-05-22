//
//  TableViewCells.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 22.05.2021.
//

import UIKit

enum TableViewCells: Int {
    case news
    
    var name: String {
        switch self {
        case .news:
            return "NewsTableViewCell"
        }
    }
    
    var id: String {
        return "\(self.name)ID"
    }
}

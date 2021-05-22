//
//  Images.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 4.05.2021.
//

import UIKit

enum Images: Int {
    case home
    case categories
    case sideMenu
    case general
    case economy
    case sport
    case world
    case settings
    
    var imageName: String {
        switch self {
        case .home:
            return "home"
        case .categories:
            return "categories"
        case .sideMenu:
            return "sideMenu"
        case .general:
            return "General"
        case .economy:
            return "Economy"
        case .sport:
            return "Sport"
        case .world:
            return "World"
        case .settings:
            return "settings"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
}

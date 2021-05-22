//
//  Storyboards.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import UIKit

enum Storyboards: Int {
    case splash
    case home
    case categories
    case webView
    case sideMenu
    case settings
    
    var name: String {
        switch self {
        case .splash:
            return "Splash"
        case .home:
            return "Home"
        case .categories:
            return "Categories"
        case .webView:
            return "Web"
        case .sideMenu:
            return "SideMenu"
        case .settings:
            return "Settings"
        }
    }
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "\(self.name)Screen", bundle: nil)
    }

    var viewController: UIViewController? {
        return self.storyboard.instantiateInitialViewController()
    }
}

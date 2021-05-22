//
//  TabBarItems.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import UIKit

enum TabBarItems: Int {
    case home
    case categories
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .categories:
            return "Categories"
        }
    }

    var image: UIImage? {
        switch self {
        case .home:
            return Images.home.image
        case .categories:
            return Images.categories.image
        }
    }
    
    var tag: Int {
        return self.rawValue
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: self.title, image: self.image, tag: self.tag)
    }
    
    var viewController: UINavigationController {
        let viewController: UIViewController
        
        switch self {
        case .home:
            guard let homeViewController = Storyboards.home.viewController else { return UINavigationController()}
            viewController = homeViewController
        case .categories:
            guard let categoriesViewController = Storyboards.categories.viewController else { return UINavigationController() }
            viewController = categoriesViewController
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = self.tabBarItem
        
        return navigationController
    }
}

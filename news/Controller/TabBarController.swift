//
//  TabBarController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 4.05.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        
        let homeViewController = TabBarItems.home.viewController
        let categoriesViewController = TabBarItems.categories.viewController
        
        self.setViewControllers([homeViewController, categoriesViewController], animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
}

//
//  SplashViewController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 4.05.2021.
//

import UIKit

class SplashViewController: BaseViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.hideNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let tabBarController = TabBarController()
            
            rootController = tabBarController
            self.show(tabBarController, sender: nil)
        }
    }
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
}

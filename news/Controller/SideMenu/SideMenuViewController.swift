//
//  SideMenuViewController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 16.05.2021.
//

import UIKit

class SideMenuViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var generalButton: SideMenuButton!
    @IBOutlet weak var economyButton: SideMenuButton!
    @IBOutlet weak var sportButton: SideMenuButton!
    @IBOutlet weak var worldButton: SideMenuButton!
    @IBOutlet weak var settingsButton: SideMenuButton!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.addLeftSwipe()
        self.addTapGesture()
    }
    
    
    // MARK: - Setup
    
    func setup() {
        self.generalButton.configure(Images.general.image, "General", .general)
        self.economyButton.configure(Images.economy.image, "Economy", .economy)
        self.sportButton.configure(Images.sport.image, "Sport", .sport)
        self.worldButton.configure(Images.world.image, "World", .world)
        self.settingsButton.configure(Images.settings.image, "Settings", .settings)
        
        self.generalButton.delegate = self
        self.economyButton.delegate = self
        self.sportButton.delegate = self
        self.worldButton.delegate = self
        self.settingsButton.delegate = self
    }
    
    
    // MARK: - Actions
    
    @objc func didSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.close()
        }
    }
    
    @objc func didTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.view)
        if !containerView.point(inside: location, with: nil) {
            self.close()
        }
    }
    
    
    // MARK: - Methods
    
    func addLeftSwipe() {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipeLeft(_:)))
        swipeGestureRecognizer.direction = .left
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func addTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapped(_:)))
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SideMenuViewController: SideMenuButtonDelegate {
    func buttonDidTapped(_ type: SideMenuButtonType) {
        self.close()
        
        switch type {
        case .general:
            self.updateTag(.general)
        case .economy:
            self.updateTag(.economy)
        case .sport:
            self.updateTag(.sport)
        case .world:
            self.updateTag(.world)
        case .settings:
            guard let settingsViewController = Storyboards.settings.viewController as? SettingsViewController else { return }
            
            rootController?.show(settingsViewController, sender: nil)
        }
    }
}

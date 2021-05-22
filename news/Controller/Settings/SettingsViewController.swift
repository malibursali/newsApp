//
//  SettingsViewController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 19.05.2021.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        self.notificationSwitch.setOn(Utililties.shared.getNotificationState(), animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.showNavigationBar()
    }
    
    
    // MARK: - Actions
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        Utililties.shared.setNotificationState(sender.isOn)
    }
}

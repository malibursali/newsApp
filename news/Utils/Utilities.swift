//
//  Utilities.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 19.05.2021.
//

import Foundation

class Utililties {
    static let shared = Utililties()
    
    func setNotificationState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: "notificationState")
    }
    
    func getNotificationState() -> Bool {
        UserDefaults.standard.bool(forKey: "notificationState")
    }
}

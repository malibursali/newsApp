//
//  NotificationName.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 19.05.2021.
//

import Foundation

enum NotificationName: String {
    case sideMenuElementTapped
    
    var name: NSNotification.Name {
        return .init(self.rawValue)
    }
}

//
//  NotificationModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 24/10/22.
//

import Foundation

struct NotificationModel: Identifiable {
    let id = UUID()
    let type: NotificationType
    let event: String?
    let username: String?
}

// MARK: - Example Item
extension NotificationModel {
    
    static var example1: NotificationModel {

        NotificationModel(
            type: NotificationType.howWasExperience,
            event: "Food Experience",
            username: nil
        )
    }
    
    static var example2: NotificationModel {

        NotificationModel(
            type: NotificationType.goingToEvent,
            event: "Food Experience",
            username: "Juuh_moreira"
        )
    }
    
    static var example3: NotificationModel {

        NotificationModel(
            type: NotificationType.connection,
            event: nil,
            username: "Barbra"
        )
    }
}

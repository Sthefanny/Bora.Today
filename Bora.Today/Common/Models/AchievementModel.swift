//
//  AchievementModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 21/10/22.
//

import Foundation

struct AchievementModel: Identifiable {
    let id = UUID()
    let image: String
    let date: String
}

// MARK: - Example Item
extension AchievementModel {
    
    static var example1: AchievementModel {

        AchievementModel(
            image: "achiev1",
            date: "23.04.2022"
        )
    }
    
    static var example2: AchievementModel {

        AchievementModel(
            image: "achiev2",
            date: "03.12.2021"
        )
    }
    
    static var example3: AchievementModel {

        AchievementModel(
            image: "achiev3",
            date: "18.10.2022"
        )
    }
}


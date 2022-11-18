//
//  TopExperiencesModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 05/10/22.
//

import Foundation

struct TopExperienceModel {
    var experiences: [ExperienceModel]
}

// MARK: - Example Item
extension TopExperienceModel {
    
    static var example: TopExperienceModel {

        TopExperienceModel(
            experiences: [ExperienceModel.example1, ExperienceModel.example2, ExperienceModel.example3]
        )
    }
}

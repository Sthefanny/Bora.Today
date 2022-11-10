//
//  ReviewModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import Foundation
import SwiftUI

struct ReviewModel: Identifiable {
    let id = UUID()
    let user: UserModel
    let location: String
    let text: String
    let score: CGFloat
    let tags: [String]?
    let images: [UIImage]
}

#if DEBUG
// MARK: - Example Item
extension ReviewModel {
    
    static var example1: ReviewModel {

        ReviewModel(
            user: UserModel.example1,
            location: "Condomínio Sachas",
            text: "Um hamburguão muito foda com nasdjna campeaonato de VR very funnnn ladlsad jklsaj dlska jdlksa ldksja lkdjsa dkhsuai hdsakjndsa",
            score: 5.0,
            tags: ["Acessível", "Divertido", "Barato"],
            images: []
        )
    }
    
    static var example2: ReviewModel {

        ReviewModel(
            user: UserModel.example2,
            location: "Casa da Stel",
            text: "Um hamburguão muito foda com nasdjna campeaonato de VR very funnnn ladlsad jklsaj dlska jdlksa ldksja lkdjsa dkhsuai hdsakjndsa",
            score: 3.0,
            tags: ["Acessível", "Divertido", "Barato"],
            images: [UIImage(named: "today_bg")!, UIImage(named: "today_bg")!, UIImage(named: "today_bg")!]
        )
    }
    
    static var example3: ReviewModel {

        ReviewModel(
            user: UserModel.example3,
            location: "Outback",
            text: "Um hamburguão muito foda com nasdjna campeaonato de VR very funnnn ladlsad jklsaj dlska jdlksa ldksja lkdjsa dkhsuai hdsakjndsa",
            score: 2.0,
            tags: ["Acessível", "Divertido", "Barato"],
            images: [UIImage(named: "today_bg")!, UIImage(named: "today_bg")!, UIImage(named: "today_bg")!]
        )
    }
}
#endif

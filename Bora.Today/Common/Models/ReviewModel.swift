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
    let tags: [TagModel]?
    let images: [UIImage]
}

// MARK: - Example Item
extension ReviewModel {
    
    static var example1: ReviewModel {

        ReviewModel(
            user: UserModel.example1,
            location: "Condomínio Sachas",
            text: "Faltou um pouco mais de infraestrutura. O porteiro não estava na hora, fiquei esperando por 15 minutos...",
            score: 2.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: []
        )
    }
    
    static var example2: ReviewModel {

        ReviewModel(
            user: UserModel.example2,
            location: "Casa da Stel",
            text: "Um hamburguão muito bom! Com campeonato de VR muito divertido!!",
            score: 5.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: [UIImage(named: "today_bg")!, UIImage(named: "pic3")!, UIImage(named: "pic2")!]
        )
    }
    
    static var example3: ReviewModel {

        ReviewModel(
            user: UserModel.example3,
            location: "Outback",
            text: "Primeira reunião com a galera.. foi bom demaaaais!!!",
            score: 4.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: [UIImage(named: "today_bg")!]
        )
    }
    
    static var example4: ReviewModel {

        ReviewModel(
            user: UserModel.example4,
            location: "Outback",
            text: "Primeira reunião com a galera.. foi bom demaaaais!!!",
            score: 4.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: [UIImage(named: "pic2")!]
        )
    }
    static var example5: ReviewModel {

        ReviewModel(
            user: UserModel.example5,
            location: "Outback",
            text: "Primeira reunião com a galera.. foi bom demaaaais!!!",
            score: 4.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: [UIImage(named: "pic3")!, UIImage(named: "pic2")!]
        )
    }
    static var example6: ReviewModel {

        ReviewModel(
            user: UserModel.example6,
            location: "Outback",
            text: "Primeira reunião com a galera.. foi bom demaaaais!!!",
            score: 4.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: [UIImage(named: "pic3")!]
        )
    }
    static var example7: ReviewModel {

        ReviewModel(
            user: UserModel.example7,
            location: "Outback",
            text: "Primeira reunião com a galera.. foi bom demaaaais!!!",
            score: 4.0,
            tags: [TagModel.accessible, TagModel.fun, TagModel.cheap],
            images: []
        )
    }
}

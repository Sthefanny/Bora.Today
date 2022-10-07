//
//  ExperienceModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 04/10/22.
//

import Foundation

struct ExperienceModel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let datetime: String
    let image: String
    let stickers: [StickerModel]?
}

#if DEBUG
// MARK: - Example Item
extension ExperienceModel {
    
    static var example1: ExperienceModel {

        ExperienceModel(
            name: "Rolê de Skate",
            location: "Condomínio Sachas",
            datetime: "Hoje, 18:00 AM",
            image: "today_bg",
            stickers: [StickerModel.legal, StickerModel.bora, StickerModel.top]
        )
    }
    
    static var example2: ExperienceModel {

        ExperienceModel(
            name: "Burguer na Stel",
            location: "Casa da Stel",
            datetime: "12/10/2022, 18:00 AM",
            image: "exp1",
            stickers: [StickerModel.legal, StickerModel.top]
        )
    }
    
    static var example3: ExperienceModel {

        ExperienceModel(
            name: "Brooday",
            location: "Outback",
            datetime: "Amanha, 18:00 AM",
            image: "exp2",
            stickers: [StickerModel.top]
        )
    }
}
#endif
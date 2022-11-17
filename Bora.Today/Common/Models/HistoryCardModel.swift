//
//  HistoryCardModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 18/10/22.
//

import SwiftUI

struct HistoryCardModel {
    let color: Color
    let isBig: Bool
    let title: String
    let subtitle: String?
    let number: String
    let image: String
    let additionalText: String?
}

// MARK: - Example Item
extension HistoryCardModel {
    
    static var example1: HistoryCardModel {

        HistoryCardModel(
            color: Color.appOrange,
            isBig: true,
            title: "Agenda",
            subtitle: "Sexta-feira",
            number: "30",
            image: "history_card_agenda",
            additionalText: "Nenhum evento hoje"
        )
    }
    
    static var example2: HistoryCardModel {

        HistoryCardModel(
            color: Color.appBlue,
            isBig: false,
            title: "Salvos",
            subtitle: nil,
            number: "11",
            image: "history_card_saved",
            additionalText: nil
        )
    }
    
    static var example3: HistoryCardModel {

        HistoryCardModel(
            color: Color.appPink,
            isBig: false,
            title: "Criados",
            subtitle: nil,
            number: "6",
            image: "history_card_created",
            additionalText: nil
        )
    }
}

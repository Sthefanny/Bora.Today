//
//  EventModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/10/22.
//

import Foundation

struct EventModel: Identifiable {
    let id = UUID()
    let date: String
    let startHour: String
    let endHour: String
    let name: String
    let location: String
}

#if DEBUG
// MARK: - Example Item
extension EventModel {
    
    static var example1: EventModel {

        EventModel(
            date: "27/10/2022",
            startHour: "08:00",
            endHour: "09:00",
            name: "Hamburguer da Stel",
            location: "Parque Barigui"
        )
    }
    
    static var example2: EventModel {

        EventModel(
            date: "20/10/2022",
            startHour: "13:00",
            endHour: "15:00",
            name: "Festa da Aninha",
            location: "Minha casa"
        )
    }
}
#endif

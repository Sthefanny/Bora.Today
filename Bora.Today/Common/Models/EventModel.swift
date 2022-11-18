//
//  EventModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/10/22.
//

import Foundation

struct EventModel: Identifiable {
    let id = UUID()
    let initialDate: String
    let finalDate: String
    let date: String
    let startHour: String
    let endHour: String
    let name: String
    let location: String
}

// MARK: - Example Item
extension EventModel {
    
    static var example1: EventModel {

        EventModel(
            initialDate: "2022-11-02T08:00:00-0300",
            finalDate: "2022-11-02T09:00:00-0300",
            date: "02/11/2022",
            startHour: "08:00",
            endHour: "09:00",
            name: "Hamburguer da Stel",
            location: "Parque Barigui"
        )
    }
    
    static var example2: EventModel {

        EventModel(
            initialDate: "2022-11-05T11:00:00-0300",
            finalDate: "2022-11-05T13:00:00-0300",
            date: "20/10/2022",
            startHour: "13:00",
            endHour: "15:00",
            name: "Festa da Aninha",
            location: "Minha casa"
        )
    }
    
    static var example3: EventModel {

        EventModel(
            initialDate: "2022-11-10T11:00:00-0300",
            finalDate: "2022-11-10T13:00:00-0300",
            date: "20/10/2022",
            startHour: "13:00",
            endHour: "15:00",
            name: "Festa da Jessie",
            location: "Casa da Jessie"
        )
    }
}

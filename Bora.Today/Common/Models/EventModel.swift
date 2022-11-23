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
    let location: PlaceModel
}

// MARK: - Example Item
extension EventModel {
    
    static var example1: EventModel {

        EventModel(
            initialDate: DateHelper.getDateAsString(Date.now),
            finalDate: "2022-11-02T09:00:00-0300",
            location: PlaceModel.place2
        )
    }
    
    static var example2: EventModel {

        EventModel(
            initialDate: "2022-11-05T11:00:00-0300",
            finalDate: "2022-11-05T13:00:00-0300",
            location: PlaceModel.place1
        )
    }
    
    static var example3: EventModel {

        EventModel(
            initialDate: "2022-11-10T11:00:00-0300",
            finalDate: "2022-11-10T13:00:00-0300",
            location: PlaceModel.place3
        )
    }
}

//
//  LocationHistoryModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/10/22.
//

import Foundation

struct LocationHistoryModel: Identifiable {
    let id = UUID()
    let location: String
}

// MARK: - Example Item
extension LocationHistoryModel {
    
    static var example1: LocationHistoryModel {

        LocationHistoryModel(
            location: "Londres, Reino Unido"
        )
    }
    
    static var example2: LocationHistoryModel {

        LocationHistoryModel(
            location: "São Paulo, Brasil"
        )
    }
    
    static var example3: LocationHistoryModel {

        LocationHistoryModel(
            location: "Engenheiro Beltrão, Brasil"
        )
    }
    
    static var example4: LocationHistoryModel {

        LocationHistoryModel(
            location: "Milão, Itália"
        )
    }
    
    static var example5: LocationHistoryModel {

        LocationHistoryModel(
            location: "São José dos Campos, Itália"
        )
    }
}


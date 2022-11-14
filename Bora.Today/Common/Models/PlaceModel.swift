//
//  MapLocationModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/09/22.
//

import Foundation
import MapKit

struct PlaceModel: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let address: String
    let openTime: String
    let url: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

#if DEBUG
// MARK: - Example Item
extension PlaceModel {
    
    static var place1: PlaceModel {
        
        PlaceModel(
            name: "Universidade Tecnológica Federal do Paraná",
            rating: 3.1,
            address: "Av. Sete de Setembro, 3165 - Rebouças, Curitiba - PR",
            openTime: "7h - 22h",
            url: "http://utfpr.com",
            latitude: 20,
            longitude: 20)
        
    }
    
    static var place2: PlaceModel {
        
        PlaceModel(
            name: "Apple Developer Academy",
            rating: 5.0,
            address: "Rua Imaculada Conceição, 1155 - Prado Velho, Curitiba - PR",
            openTime: "8h30 - 17h",
            url: "http://ada.com",
            latitude: 40,
            longitude: 40)
        
    }
    
    static var place3: PlaceModel {
        
        PlaceModel(
            name: "Casa da Estudante Universitária de Curitiba",
            rating: 1.2,
            address: "Rua Gen. Carneiro, 360 - Alto da Glória, Curitiba - PR",
            openTime: "8h30 - 17h",
            url: "http://ceu.com",
            latitude: 50,
            longitude: 50)
        
    }
    
}
#endif

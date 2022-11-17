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
    let url: String
    let latitude: Double
    let longitude: Double
    let postalCode: String
    let street: String
    let district: String
    let city: String
    let state: String
    let country: String
    let address: String
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(name: String, url: String, latitude: Double, longitude: Double, postalCode: String, street: String, district: String, city: String, state: String, country: String) {
        self.name = name
        self.url = url
        self.latitude = latitude
        self.longitude = longitude
        self.postalCode = postalCode
        self.street = street
        self.district = district
        self.city = city
        self.state = state
        self.country = country
        
        self.address = "\(street) - \(district)"
    }
}

// MARK: - Example Item
extension PlaceModel {
    
    static var place1: PlaceModel {
        
        PlaceModel(
            name: "Universidade Tecnológica Federal do Paraná",
            url: "http://utfpr.com",
            latitude: 20,
            longitude: 20,
            postalCode: "89036-050",
            street: "Rua Alberto Stein, 199",
            district: "Velha",
            city: "Blumenau",
            state: "SC",
            country: "Brazil"
        )
        
    }
    
}

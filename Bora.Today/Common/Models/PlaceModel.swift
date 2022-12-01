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
    let reviews: [ReviewModel]?
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(name: String, url: String, latitude: Double, longitude: Double, postalCode: String, street: String, district: String, city: String, state: String, country: String, reviews: [ReviewModel]?) {
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
        self.reviews = reviews
        
        self.address = "\(street) - \(district)"
    }
}

// MARK: - Example Item
extension PlaceModel {
    
    static var place1: PlaceModel {
        
        PlaceModel(
            name: "Universidade Tecnológica Federal do Paraná",
            url: "www.utfpr.edu.br",
            latitude: 20,
            longitude: 20,
            postalCode: "89036-050",
            street: "Av. Sete de Setembro, 3165 - Rebouças, Curitiba - PR",
            district: "Velha",
            city: "Curitiba",
            state: "PR",
            country: "Brazil",
            reviews: [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3]
        )
    }
    
    static var place2: PlaceModel {
        
        PlaceModel(
            name: "Apple Developer Academy",
            url: "developeracademy.pucpr.br",
            latitude: 20,
            longitude: 20,
            postalCode: "89036-050",
            street: "Rua Imaculada Conceição, 1155 - Prado Velho, Curitiba - PR",
            district: "Velha",
            city: "Curitiba",
            state: "PR",
            country: "Brazil",
            reviews: [ReviewModel.example3, ReviewModel.example2]
        )
    }
    
    static var place3: PlaceModel {
        
        PlaceModel(
            name: "Casa da Estudante Universitária de Curitiba",
            url: "www.ceupr.com",
            latitude: 20,
            longitude: 20,
            postalCode: "89036-050",
            street: "Rua Gen. Carneiro, 360 - Alto da Glória, Curitiba - PR",
            district: "Velha",
            city: "Curitiba",
            state: "PR",
            country: "Brazil",
            reviews: [ReviewModel.example2]
        )
    }
    
    static var place4: PlaceModel {
        
        PlaceModel(
            name: "Hostel Social - Café e Bar",
            url: "instagram.com/hostelsocial",
            latitude: 20,
            longitude: 20,
            postalCode: "89036-050",
            street: "Rua Brg. Franco, 2691 - Rebouças, Curitiba - PR",
            district: "Velha",
            city: "Curitiba",
            state: "PR",
            country: "Brazil",
            reviews: [ReviewModel.example1, ReviewModel.example3]
        )
    }
    
    static var place5: PlaceModel {
        
        PlaceModel(
            name: "Capivara's Hostel & Lounge Bar",
            url: "instagram.com/capivarashostelloungebar/",
            latitude: 20,
            longitude: 20,
            postalCode: "89036-050",
            street: "Rua Desembargador Motta, 3535 - Mercês, Curitiba - PR, 80430-232",
            district: "Velha",
            city: "Curitiba",
            state: "PR",
            country: "Brazil",
            reviews: [ReviewModel.example3, ReviewModel.example2, ReviewModel.example1]
        )
    }
}

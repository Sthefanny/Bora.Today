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
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

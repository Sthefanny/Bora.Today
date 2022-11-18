//
//  LocationManager.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 20/09/22.
//

import Foundation
import CoreLocation
import MapKit

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var location: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -25.452946, longitude: -49.2540298),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    @Published var mapLocations: [PlaceModel] = []
    @Published var shouldUpdate: Bool = true
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        requestLocation()
    }
    
    func requestLocation() {
        requestAuthorization(always: true)
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        if shouldUpdate {
            shouldUpdate = false
            self.location = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //Handle any errors here...
        print (error)
        AppHelper.logError(domain: "LocationManager", code: nil)
    }
    
    public func requestAuthorization(always: Bool = false) {
        if self.authorizationStatus == .denied || self.authorizationStatus == .notDetermined {
            if always {
                self.locationManager.requestAlwaysAuthorization()
            } else {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorizationStatus = status
    }
    
    func search(_ term: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = term
        
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                print (error as Any)
                AppHelper.logError(domain: "LocationManager.search", code: nil)
                return
            }
            
            for item in response.mapItems {
                let location = item.placemark.location?.coordinate
                
                let placeMark = item.placemark as MKPlacemark
                let address = placeMark.addressDictionary! as NSDictionary
                
                let name = item.name
                let street = address.object(forKey: "Street") as? String
                let district = address.object(forKey: "SubLocality") as? String
                let city = address.object(forKey: "City") as? String
                let state = address.object(forKey: "State") as? String
                let postalCode = address.object(forKey: "ZIP") as? String
                let country = address.object(forKey: "Country") as? String
                
                let url = item.url?.absoluteString
                
                self.mapLocations = []
                self.mapLocations.append(
                    PlaceModel(
                        name: name ?? "",
                        url: url ?? "",
                        latitude: location?.latitude ?? 0,
                        longitude: location?.longitude ?? 0,
                        postalCode: postalCode ?? "",
                        street: street ?? "",
                        district: district ?? "",
                        city: city ?? "",
                        state: state ?? "",
                        country: country ?? ""
                    )
                )
            }
        }
    }
}

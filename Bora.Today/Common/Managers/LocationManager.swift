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
    private let locationManager = CLLocationManager()
    
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var location: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -25.452946, longitude: -49.2540298),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    @Published var mapLocations: [PlaceModel] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        requestAuthorization(always: true)
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        DispatchQueue.main.async {
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
    
    func test() {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "PUCPR"
        
        // Set the region to an associated map view's region.
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                print (error as Any)
                AppHelper.logError(domain: "LocationManager.test", code: nil)
                return
            }
            
            for item in response.mapItems {
                if let name = item.name,
                   let location = item.placemark.location {
                    print("\(name): \(location.coordinate.latitude),\(location.coordinate.longitude)")
                    
                    self.mapLocations.append(PlaceModel(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
                }
            }
        }
    }
}

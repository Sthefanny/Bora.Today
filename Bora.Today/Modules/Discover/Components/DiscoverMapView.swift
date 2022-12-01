//
//  DiscoverMapView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 13/11/22.
//

import SwiftUI
import MapKit

struct DiscoverMapView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @Binding var discoverVisualization: DiscoverVisualization
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.bottom)
            
            if discoverVisualization == .experience {
                ExperienceCardOnMapView(model: ExperienceModel.example1)
                    .padding(.horizontal, 21)
                    .padding(.bottom, 48)
            } else {
                PlaceCardOnMapView(model: PlaceModel.place1)
                    .padding(.horizontal, 21)
                    .padding(.bottom, 48)
            }
        }
    }
}

struct DiscoverMapView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMapView(discoverVisualization: .constant(.experience))
    }
}

//
//  HomeView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 15/09/22.
//

import SwiftUI
import FirebaseAnalytics
import MapKit

struct HomeView: View {
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("hello_world".localized(language))
                    .font(.appLargeTitle)
                    .padding()
                
                Text("**Hey Maria Inês,**\nWelcome to \(Text("Curitiba").underline().foregroundColor(Color.orange))")
                    .font(.appTitle2)
                
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: locationManager.mapLocations) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        NavigationLink {
                            CreateView()
                        } label: {
                            PlaceAnnotationView(title: place.name)
                        }
                    }
                    
                }
                .frame(height: proxy.size.height * 0.2)
                .cornerRadius(10)
                
                Text("Recomendados")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .padding(.top, 20)
                
                Spacer()
                
                Button("Teste", action: locationManager.test)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .onAppear() {
                AppHelper.logPage(pageName: "\(HomeView.self)")
                locationManager.requestLocation()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

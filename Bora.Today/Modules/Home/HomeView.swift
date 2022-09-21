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
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("**Hey Maria Inês,**\nWelcome to \(Text("Curitiba").underline().foregroundColor(Color.orange))")
                    .font(Font.custom("Figtree", size: 22))
                
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                    .frame(height: proxy.size.height * 0.2)
                    .cornerRadius(10)
                
                Text("Recomendados")
                    .fontWeight(.semibold)
                    .font(Font.custom("Figtree", size: 17))
                    .padding(.top, 20)
                
                Spacer()
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

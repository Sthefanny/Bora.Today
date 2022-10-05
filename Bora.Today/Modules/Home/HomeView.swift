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
        GeometryReader { screen in
            VStack(alignment: .leading) {
                Text("today_title".localized(language))
                    .font(.appTitle1)
                    .padding(.vertical, 16)
                    .padding(.leading, 21)
                
                BannerListView(model: TopExperienceModel.example)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

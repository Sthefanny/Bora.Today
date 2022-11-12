//
//  DiscoverView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 08/11/22.
//

import SwiftUI
import MapKit

struct DiscoverView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @StateObject var locationManager = LocationManager()
    
    @State private var selection = 0
    
    var body: some View {
        GeometryReader { screen in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    _buildHeader
                    
                    _buildSearch
                    
                    _buildViewTypes
                    
                    
                    Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                        .onAppear {
                            locationManager.test()
                        }
                    
                    
                }
                .frame(width: screen.size.width, height: screen.size.height, alignment: .topLeading)
            }
            .frame(height: screen.size.height)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear() {
            AppHelper.logPage(pageName: "\(DiscoverView.self)")
            locationManager.requestLocation()
        }
    }
    
    private var _buildHeader: some View {
        HStack(spacing: 0) {
            Text("discoverTitle".localized(language))
                .font(.appTitle1)
                .foregroundColor(.appBlack)
            
            Spacer()
            
            HStack(spacing: 4) {
                Image("create")
                    .renderingMode(.template)
                    .foregroundColor(.appBlueButton)
                
                Text("createButton".localized(language))
                    .font(.appButtonText)
                    .foregroundColor(.appBlueButton)
            }
        }
        .padding(.horizontal, 21)
        .padding(.vertical, 16)
    }
    
    private var _buildSearch: some View {
        TextFieldView(icon: "magnifyingglass", placeholder: "searchPlaceholder")
            .padding(.bottom, 16)
            .padding(.horizontal, 21)
    }
    
    private var _buildViewTypes: some View {
        HStack(alignment: .center, spacing: 0) {
            SwitchButtonView(leftText: "experiences".localized(language), rightText: "places".localized(language), leftAction: {}, rightAction: {})
            
            Spacer()
            
            ButtonDefault(buttonType: .imageAndText, text: "map".localized(language), icon: "map.fill", action: {}, isDisabled: .constant(false))
        }
        .padding(.horizontal, 21)
        .padding(.bottom, 16)
    }
    
    private func ShowCardExperience() -> any View {
        Text("teste")
    }
    
    private func ShowCardPlace() -> any View {
        Text("teste")
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

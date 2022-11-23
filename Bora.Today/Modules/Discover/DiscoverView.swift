//
//  DiscoverView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 08/11/22.
//

import SwiftUI

struct DiscoverView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @StateObject var locationManager = LocationManager()
    
    @State private var selection = 0
    
    @State private var experienceModel: ExperienceModel?
    @State private var placeModel: PlaceModel?
    
    @State var discoverVisualization: DiscoverVisualization = .experience
    @State var viewType: DiscoverType = .map
    
    @EnvironmentObject var textFieldData: TextFieldData
    
    var body: some View {
        GeometryReader { screen in
            VStack(alignment: .leading, spacing: 0) {
                _buildHeader
                
                _buildSearch
                
                _buildViewTypes
                
                if viewType == .map {
                    DiscoverMapView(discoverVisualization: $discoverVisualization)
                        .padding(.bottom, AppConfig.bottomMenuHeight / 2)
                } else {
                    if discoverVisualization == .experience {
                        ExperienceCardListView()
                    } else {
                        PlaceCardListView()
                    }
                }
            }
            .frame(width: screen.size.width, height: screen.size.height, alignment: .topLeading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear() {
            AppHelper.logPage(pageName: "\(DiscoverView.self)")
            experienceModel = ExperienceModel.example1
            placeModel = PlaceModel.place1
        }
    }
    
    private var _buildHeader: some View {
        HStack(spacing: 0) {
            Text("discoverTitle".localized(language))
                .font(.appTitle1)
                .foregroundColor(.appBlack)
            
            Spacer()
            
            
            NavigationLink(destination: CreateView(shouldShowBack: true)) {
                ButtonText(buttonType: .imageAndText, text: "createButton".localized(language), icon: "create", action: {}, color: .appBlueButton, isDisabled: .constant(false))
            }
        }
        .padding(.horizontal, 21)
        .padding(.vertical, 16)
    }
    
    private var _buildSearch: some View {
        TextFieldView(icon: "magnifyingglass", placeholder: "searchPlaceholder", action: {
            if viewType == .map {
                locationManager.search(textFieldData.text)
            }
        })
        .padding(.bottom, 16)
        .padding(.horizontal, 21)
    }
    
    private var _buildViewTypes: some View {
        HStack(alignment: .center, spacing: 0) {
            SwitchButtonView(leftText: "experiences".localized(language), rightText: "places".localized(language), leftAction: {
                self.discoverVisualization = .experience
            }, rightAction: {
                self.discoverVisualization = .place
            })
            
            Spacer()
            
            if viewType == .map {
                ButtonDefault(buttonType: .iconAndText, text: "list".localized(language), icon: "list.bullet.circle.fill", action: {
                    viewType = .list
                }, isDisabled: .constant(false))
            } else {
                ButtonDefault(buttonType: .iconAndText, text: "map".localized(language), icon: "map.fill", action: {
                    viewType = .map
                }, isDisabled: .constant(false))
            }
        }
        .padding(.horizontal, 21)
        .padding(.bottom, 16)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

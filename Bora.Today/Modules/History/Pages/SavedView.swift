//
//  SavedView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 28/11/22.
//

import SwiftUI

struct SavedView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State var discoverVisualization: DiscoverVisualization = .experience
    
    private var modelExp: [ExperienceModel] = [
        .example2,
        .example5,
        .example6
    ]
    
    private var modelPlace: [PlaceModel] = [
        .place1,
        .place2,
        .place3
    ]
    
    var body: some View {
        VStack {
            HeaderView(headerTitle: "savedTitle", showCreateButton: true)
            
            _buildViewTypes
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    if discoverVisualization == .experience {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(0..<modelExp.count, id: \.self) { index in
                                let item = modelExp[index]
                                HStack(spacing: 8) {
                                    ExperienceCardView(model: item, isInDiscover: false, isSaved: false)
                                }
                                Divider()
                                    .overlay(Color.appGray)
                            }
                        }
                        
                    } else {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(0..<modelPlace.count, id: \.self) { index in
                                let item = modelPlace[index]
                                HStack(spacing: 8) {
                                    PlaceCardView(model: item, isInDiscover: false, isSaved: false)
                                }
                                Divider()
                                    .overlay(Color.appGray)
                            }
                        }
                    }
                }
                .padding(.vertical, 16)
            }
            .padding(.horizontal, AppConfig.safeAreaHorizontal)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private var _buildViewTypes: some View {
        HStack(alignment: .center, spacing: 0) {
            SwitchButtonView(leftText: "experiences".localized(language), rightText: "places".localized(language), leftAction: {
                self.discoverVisualization = .experience
            }, rightAction: {
                self.discoverVisualization = .place
            })
        }
        .padding(.horizontal, 21)
        .padding(.bottom, 16)
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}

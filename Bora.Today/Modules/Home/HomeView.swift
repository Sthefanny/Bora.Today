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
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                Color.white
                VStack(alignment: .leading, spacing: 0) {
                    Text("today_title".localized(language))
                        .font(.appTitle1)
                        .foregroundColor(.appBlack)
                        .padding(.vertical, 16)
                        .padding(.leading, 21)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            
                            BannerListView(model: TopExperienceModel.example)
                                .frame(height: screen.size.height * 0.3)
                            
                            Text("recommended".localized(language))
                                .font(.appTitle3)
                                .fontWeight(.semibold)
                                .foregroundColor(.appBlack)
                                .padding(.vertical, 16)
                                .padding(.leading, 21)
                            
                            ExperienceListView(model: TopExperienceModel.example)
                                .frame(height: screen.size.height * 0.4)
                            
                            ReviewListView(model: [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3])
                                .frame(height: screen.size.height * 0.35)
                            Spacer()
                        }
                    }
                    .frame(height: screen.size.height)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

//
//  HomeView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 15/09/22.
//

import SwiftUI
import FirebaseAnalytics

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home View aqui!")
        }
        .onAppear() {
            AnalyticsHelper.logPage(pageName: "\(HomeView.self)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

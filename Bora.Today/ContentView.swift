//
//  ContentView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/08/22.
//

import SwiftUI
import FirebaseAnalytics

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Button("Crash") {
                fatalError("Crash was triggered")
            }
        }
        .onAppear() {
            Analytics.logEvent(AnalyticsEventScreenView,
                               parameters: [AnalyticsParameterScreenName: "\(ContentView.self)",
                                           AnalyticsParameterScreenClass: "\(ContentView.self)"])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

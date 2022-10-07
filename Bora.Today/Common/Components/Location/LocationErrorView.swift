//
//  LocationErrorView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/10/22.
//

import SwiftUI

struct LocationErrorView: View {
    @StateObject var locationManager = LocationManager()
    var errorText: String
        
        var body: some View {
            VStack {
                Image(systemName: "xmark.octagon")
                        .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                Text(errorText)
                
                Button("Request again") {
                    AppHelper.openMobileSettings()
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
        }
}

struct LocationErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LocationErrorView(errorText: "Error")
    }
}

//
//  RequestLocationView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/10/22.
//

import SwiftUI

struct RequestLocationView: View {
    @EnvironmentObject var locationManager: LocationManager
        
        var body: some View {
            VStack {
                Image(systemName: "location.circle")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Button(action: {
                    print("allowing perms")
                }, label: {
                    Label("Allow tracking", systemImage: "location")
                })
                .padding(10)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                Text("We need your permission to track you.")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}

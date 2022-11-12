//
//  ProfileImageLargeView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 07/11/22.
//

import SwiftUI

struct ProfileImageLargeView: View {
    let image: String
    let country: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .clipShape(Circle(), style: FillStyle())
                .frame(width: 144, height: 144, alignment: .center)
                .overlay(
                    Circle()
                    .stroke(Color.red, lineWidth: 0)
                )
                .shadow(radius: 7)
            
            FlagView(countryCode: country, size: 45)
                .offset(x: 52, y: 52)
        }
    }
}

struct ProfileImageLargeView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageLargeView(image: "today_bg", country: "BR")
    }
}

//
//  ProfileImageView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI
import SwiftFlags

struct ProfileImageView: View {
    let image: String
    let country: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .clipShape(Circle(), style: FillStyle())
                .frame(width: 70, height: 70, alignment: .center)
                .overlay(Circle()
                .stroke(Color.red, lineWidth: 0))
            
            FlagView(countryCode: country, size: 18)
                .offset(x: 27, y: 27)
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(image: "today_bg", country: "BR")
    }
}

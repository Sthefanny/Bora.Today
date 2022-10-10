//
//  ProfileImageView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI

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
            
            FlagView(countryCode: country, size: CGFloat(25))
                .offset(x: -30, y: -20)
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(image: "today_bg", country: "BR")
    }
}

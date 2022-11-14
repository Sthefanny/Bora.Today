//
//  ProfileImageView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI
import SwiftFlags

struct ProfileImageView: View {
    var size: Double
    var flagPosition: Double
    var model: UserModel?
    
    init(model: UserModel?, size: Double = 70) {
        self.size = size
        self.flagPosition = size / 2.6
        self.model = model ?? UserModel.example1
    }
    
    var body: some View {
        ZStack {
            Image(model!.image)
                .resizable()
                .clipShape(Circle(), style: FillStyle())
                .frame(width: size, height: size, alignment: .center)
                .overlay(Circle()
                .stroke(Color.red, lineWidth: 0))
            
            FlagView(countryCode: model!.originCountry, size: 18)
                .offset(x: flagPosition, y: flagPosition)
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfileImageView(model: nil)
            ProfileImageView(model: nil, size: 54)
        }
    }
}

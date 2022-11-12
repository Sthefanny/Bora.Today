//
//  SingleConnectionView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 11/11/22.
//

import SwiftUI

struct SingleConnectionView: View {
    
    var image: String
    var country: String
    var name: String
    var username: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            ProfileImageView()
                .padding(.bottom,8)
            Text(name)
                .font(.appCallout)
                .foregroundColor(.appBlack)
                .padding(.bottom,4)
            Text("@"+username)
                .font(.appCaption1)
                .foregroundColor(.appGray)
        }    }
}

struct SingleConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleConnectionView(image: "today_bg", country: "BR", name: "Maria Ines", username: "maria_ines")
    }
}

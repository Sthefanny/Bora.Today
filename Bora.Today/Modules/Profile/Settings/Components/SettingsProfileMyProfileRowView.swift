//
//  SettingsProfileMyProfileRowView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 11/11/22.
//

import SwiftUI

struct SettingsProfileMyProfileRowView: View {
    
    let model : UserModel

    var body: some View {
        HStack {
            HStack{
                ProfileImageView(model: nil)
                VStack(alignment: .leading, spacing: 4) {
                    Text(model.name)
                        .font(.appTitle2)
                        .foregroundColor(.appBlack)
                    
                    Text("@" + model.username )
                        .font(.caption2)
                        .foregroundColor(.appGrayText)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.appBlueButton)
                .frame(width: 13, height: 13)
        }
    }
}

struct SettingsProfileMyProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileMyProfileRowView(model: .example1)
            .previewLayout(.sizeThatFits)
    }
}

//
//  SettingsProfileLabelView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 10/11/22.
//

import SwiftUI

struct SettingsProfileLabelView: View {
    
    var labelText: String
    
    var body: some View {
        HStack {
            Text(labelText)
                .font(.appHeadline)
                .foregroundColor(.appBlack)
            Spacer()
        }
    }
}

struct SettingsProfileLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileLabelView(labelText: "Conexões")
            .previewLayout(.sizeThatFits)
//            .padding()
    }
}

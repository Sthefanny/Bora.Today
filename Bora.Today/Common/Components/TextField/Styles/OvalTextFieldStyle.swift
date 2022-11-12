//
//  OvalTextFieldStyle.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/11/22.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(14)
            .overlay(RoundedRectangle(cornerRadius: 26)
                .stroke(Color.appGray))
            .font(.appSubheadline)
    }
}

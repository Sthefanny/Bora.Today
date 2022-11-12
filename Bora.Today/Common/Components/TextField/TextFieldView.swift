//
//  TextFieldView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/11/22.
//

import SwiftUI

struct TextFieldView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State var value: String = ""
    var icon: String
    @State var placeholder: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
            TextField("", text: $value)
                .focused($isFocused)
                .textFieldStyle(OvalTextFieldStyle())
                .placeholder(when: value.isEmpty) {
                    HStack(spacing: 8) {
                        Image(systemName: icon).font(.system(size: 12)).foregroundColor(.appGray)
                        Text(placeholder.localized(language)).foregroundColor(.appGray).font(.appFootnote)
                    }
                    .padding(.horizontal)
                }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(icon: "magnifyingglass", placeholder: "Tags, Locais, Experiencias")
    }
}

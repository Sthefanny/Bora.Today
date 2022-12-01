//
//  TextFieldView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/11/22.
//

import SwiftUI
import Combine

class TextFieldData: ObservableObject{
    @Published var text: String = ""
}


struct TextFieldView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State var value: String = ""
    var icon: String
    @State var placeholder: String
    @FocusState private var isFocused: Bool
    @State var action: () -> Void
    
    @EnvironmentObject var textFieldData: TextFieldData
    
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
                .onChange(of: value) {_ in
                    textFieldData.text = value
                    self.action()
                }
                .environmentObject(textFieldData)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(icon: "magnifyingglass", placeholder: "Tags, Locais, Experiencias", action: {})
    }
}

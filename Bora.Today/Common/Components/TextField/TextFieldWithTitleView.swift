//
//  TextFieldWithTitleView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 18/10/22.
//

import SwiftUI

struct TextFieldWithTitleView: View {
    let title: String
    @State var value: String = ""
    var isMandatory: Bool = true
    var errorMessage: String = ""
    var validate: ((String) -> Bool)?
    
    @FocusState private var isFocused: Bool
    @State private var isValid: Bool?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Text(title)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                
                if isMandatory {
                    Image("asterisk")
                }
            }
            .padding(.bottom, 8)
            
            
            TextField("", text: $value)
                .focused($isFocused)
                .onChange(of: isFocused) { editingChanged in
                    // Check if is focus in, then return
                    if editingChanged {
                        return
                    }
                    
                    guard let validate = self.validate else { return }
                    self.isValid = validate(self.value)
                }
                .textFieldStyle(OvalTextFieldStyle())
                .padding(.bottom, 6)
            
            if !errorMessage.isEmpty && isValid == false {
                Text(errorMessage)
                    .font(.appCaption2)
                    .foregroundColor(.appRed)
            }
            
        }
        
    }
}

struct TextFieldWithTitleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextFieldWithTitleView(
                title: "Titulo do Evento",
                value: "",
                errorMessage: "Por favor, informe o Titulo do Evento") { value in
                    return !value.isEmpty
                }
        }
    }
}

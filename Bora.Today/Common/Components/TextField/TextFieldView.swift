//
//  TextFieldView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 18/10/22.
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

struct TextFieldView: View {
    let title: String
    let isMandatory: Bool
    @State private var fill = ""
    
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
            
            
            TextField("", text: $fill)
                .textFieldStyle(OvalTextFieldStyle())

        }
        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "Titulo do Evento", isMandatory: true)
    }
}

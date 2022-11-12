//
//  TextAreaLimitedView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 24/10/22.
//

import SwiftUI

struct OvalTextAreaStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 96, alignment: .topLeading)
            .padding(14)
            .overlay(RoundedRectangle(cornerRadius: 26)
                .stroke(Color.appGray))
            .font(.appSubheadline)
    }
}

struct TextAreaLimitedView: View {
    let title: String
    let example: String
    let isMandatory: Bool = true
    @StateObject var manager = TFManager()
    @State var value: String = ""
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
            
            //axis: .vertical
            TextField(example, text: $manager.text)
                .focused($isFocused)
                .onChange(of: isFocused) { editingChanged in
                    // Check if is focus in, then return
                    if editingChanged {
                        return
                    }
                    
                    guard let validate = self.validate else { return }
                    self.isValid = validate(self.value)
                }
                .lineLimit(5)
                .textFieldStyle(OvalTextAreaStyle())
                .multilineTextAlignment(.leading)
                .padding(.bottom, 8)
                
            
            
            HStack {
                
                if !errorMessage.isEmpty && isValid == false {
                    Text(errorMessage)
                        .font(.appCaption2)
                        .foregroundColor(.appRed)
                }
                
                Spacer()
                
                Text("\(manager.text.count)/300")
                    .font(.appSubheadline)
                    .foregroundColor(.appGrayText)
                    .padding(.trailing)
            }
        }
    }
}


struct TextAreaLimitedView_Previews: PreviewProvider {
    static var previews: some View {
        TextAreaLimitedView(title: "Descrição", example: "Ex.: Tópicos, agenda, etc")
    }
}

class TFManager: ObservableObject {
    
    @Published var text = "" {
        didSet {
            if text.count > 300 && oldValue.count <= 300 {
                text = oldValue
            }
        }
        
    }
}

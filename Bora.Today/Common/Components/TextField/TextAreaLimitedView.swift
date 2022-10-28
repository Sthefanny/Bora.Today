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
    let isMandatory: Bool
    @StateObject var manager = TFManager()
    
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
                .lineLimit(5)
                .textFieldStyle(OvalTextAreaStyle())
                .multilineTextAlignment(.leading)
                .padding(.bottom, 8)
            
            HStack {
                
                Spacer()
                
                Text("\(manager.text.count)/200")
                    .font(.appSubheadline)
                    .foregroundColor(.appGrayText)
                    .padding(.trailing)
            }
        }
    }
}


struct TextAreaLimitedView_Previews: PreviewProvider {
    static var previews: some View {
        TextAreaLimitedView(title: "Descrição", example: "Ex.: Tópicos, agenda, etc", isMandatory: true)
    }
}

class TFManager: ObservableObject {
    
    @Published var text = "" {
        didSet {
            if text.count > 200 && oldValue.count <= 200 {
                text = oldValue
            }
        }
        
    }
}

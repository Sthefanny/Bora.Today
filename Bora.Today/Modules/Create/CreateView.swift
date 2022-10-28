//
//  CreateView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 19/09/22.
//

import SwiftUI

struct CreateView: View {
    
    //var photoSelected: Bool = false
    
    var body: some View {
        GeometryReader { screen in
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Criar experiência")
                        .font(.appTitle1)
                        .foregroundColor(.appBlack)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 21)
                    
                    Text("PHOTO PICKER")
                        .padding(.horizontal, 21)
                
                    
                    CreateSelectStickerView()
                    
                    TextFieldView(title: "Título do evento",  isMandatory: true)
                        .padding(.horizontal, 21)
                    
                    TextFieldView(title: "Local", isMandatory: true)
                        .padding(.horizontal, 21)
                    //INTEGRAÇÃO COM MAPA AQUI PRA PEGAR LOCAIS CONFORME DIGITA
                    
                    CreateDatePickerView(date: .now)
                        .padding(.horizontal, 21)
                    
                    TextAreaLimitedView(title: "Descrição", example: "Ex.: Tópicos, agenda, etc", isMandatory: true)
                        .padding(.horizontal, 21)
                    
                    CreateSelectTagView()
                    
                    CreateSliderView()
                        .padding(.horizontal, 21)
                    
                    ButtonDefault(buttonType: .textOnly, text: "Publicar", icon: "", action: {
                        print("publicar")
                    }, isDisabled: .constant(false))
                    .frame(width: screen.size.width, alignment: .center)
                    
                    
                }
                
            
            }
        }
        
        
    }
    
    struct CreateView_Previews: PreviewProvider {
        static var previews: some View {
            CreateView()
        }
    }
}

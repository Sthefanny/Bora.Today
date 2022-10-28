//
//  CreateSelectTagView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 27/10/22.
//

import SwiftUI

struct CreateSelectTagView: View {
    
    //MUDAR AQUI COM A LÓGICA DA ANA PARA O ONBOARDING
    
    private let tags: [TagModel] = [
        .example1,
        .example2,
        .example3,
        .example1,
        .example2,
        .example3
    ]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                Text("Tags \(Image("asterisk"))")
                
                Spacer()
                
                Button(action: {
                    print("abrir modal com todas as tags")
                }) {
                    Text("Lista ordenada \(Image(systemName: "chevron.right"))")
                    
                }
            }
            .padding(.horizontal, 21)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<tags.count, id: \.self) { index in
                        let item = tags[index]
                        TagDefaultView(model: item, isSelected: false)
                            .padding(.leading, index == 0 ? 21 : 0)
                            .padding(.trailing, index == tags.count - 1 ? 21 : 0)
                    }
                }
            }
            
        }
    }
}

struct CreateSelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSelectTagView()
    }
}

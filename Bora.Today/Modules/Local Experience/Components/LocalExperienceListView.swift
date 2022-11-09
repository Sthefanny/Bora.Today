//
//  LocalExperienceListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 09/11/22.
//

import SwiftUI

struct LocalExperienceListView: View {
    
    private let model: [ExperienceModel]
    
    //lista experiências do local - precisa chamar de outro lugar

    init() {
        model = [ExperienceModel.example1, ExperienceModel.example2, ExperienceModel.example3]
        
    }
            var body: some View {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        //por algum motivo quebrou - não tá gerando imagens diferentes (aqui também, mas o problema dve ser no componente)
                        ForEach(0..<model.count) {index in
                            let item = model[index]
                            LocalExperienceCardView(model: ExperienceModel.example1)
                        }
                    }
                    .padding(.leading, 21)
                }
                
            }
        }

struct LocalExperienceListView_Previews: PreviewProvider {
    static var previews: some View {
        LocalExperienceListView()
    }
}

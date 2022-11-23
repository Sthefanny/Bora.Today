//
//  CreateSelectTagView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 27/10/22.
//

import SwiftUI

struct CreateSelectTagView: View {
    //MUDAR AQUI COM A LÓGICA DA ANA PARA O ONBOARDING
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
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
                VStack(alignment: .leading) {
                    Text("\(Text("selectTagTitle".localized(language))) \(Image("asterisk"))")
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                        
                }
               
                
                Spacer()
                
                Button(action: {
                    print("COLOCAR POP UP AQUI PopUpAllTags()")
                }) {
                    Text("\(Text("more".localized(language))) \(Image(systemName: "chevron.right"))")
                    
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
                .padding(.vertical, 1)
            }
            
        }
    }
}

struct CreateSelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSelectTagView()
    }
}

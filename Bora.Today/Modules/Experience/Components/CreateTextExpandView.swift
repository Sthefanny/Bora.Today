//
//  CreateTextExpandView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 20/10/22.
//

import SwiftUI

struct CreateTextExpandView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
        let lineLimit: Int
        
        @State private var expanded: Bool = false
        @State private var showViewButton: Bool = false
//        var text: String
    let model: ExperienceModel
    //chamar da tela de Criar Experiência
        
        var body: some View {
            VStack(alignment: .leading) {
                VStack (alignment: .leading, spacing: 16){
                    Text("aboutExperience".localized(language))
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                ZStack {
                    Text(model.description)
                        .font(.appFootnote)
                        .foregroundColor(.appBlack)
                        .lineLimit(expanded ? nil : lineLimit)
                    
                    ScrollView(.vertical) {
                        Text(model.description)
                            .font(.appFootnote)
                            .foregroundColor(.appBlack)
                            .background(
                                GeometryReader { proxy in
                                    Color.clear
                                        .onAppear {
                                            showViewButton = proxy.size.height > CGFloat(22 * lineLimit)
                                        }
                                        .onChange(of: model.description) { _ in
                                            showViewButton = proxy.size.height > CGFloat(22 * lineLimit)
                                        }
                                }
                            )
                        
                    }
                    .opacity(0.0)
                    .disabled(true)
                    .frame(height: 0.0)
                }
                }
                
                Button(action: {
                    withAnimation {
                        expanded.toggle()
                    }
                }, label: {
                    Text(moreLessText)
                        .font(.appFootnote)
                        .foregroundColor(.appBlueButton)
                })
                .opacity(showViewButton ? 1.0 : 0.0)
                .disabled(!showViewButton)
                .frame(height: showViewButton ? nil : 0.0)
                
            }
        }
    
    init(_ model: ExperienceModel, lineLimit: Int) {
        self.model = model
        self.lineLimit = lineLimit
        
    }
    
    private var moreLessText: String {
        if showViewButton {
            return expanded ? "viewLess".localized(language) : "viewMore".localized(language)
            
        } else {
            return ""
            
        }
    }


struct CreateTextExpandView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTextExpandView(ExperienceModel.example3, lineLimit: 3)
    }
}
}

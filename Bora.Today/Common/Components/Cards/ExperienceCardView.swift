//
//  ExperienceCardView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 03/11/22.
//

import SwiftUI

struct ExperienceCardView: View {
    let model: ExperienceModel
    var isInDiscover: Bool
    @State var isSaved: Bool
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            
            NavigationLink(destination: ExperienceView(model: model)) {
                Image(model.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 110)
                    .cornerRadius(18)
                    .padding(.trailing, 12)
            }
            
            NavigationLink(destination: ExperienceView(model: model)) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(model.name)
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                        .padding(.bottom, 8)
                    
                    Text(model.description)
                        .lineLimit(2)
                        .font(.appSubheadline)
                        .foregroundColor(.appBlack)
                        .padding(.bottom, 8)
                        .multilineTextAlignment(.leading)
                    
                    
                    HStack {
                        Image("pin_place")
                            .foregroundColor(.black)
                        
                        
                        Text(model.event.location.name)
                            .font(.appFootnote)
                            .foregroundColor(.appGrayText)
                        
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Image("time")
                            .foregroundColor(.black)
                        
                        Text(DateHelper.getFormattedDate(model.event.initialDate, format: "MMM dd, HH:mm"))
                            .font(.appFootnote)
                            .foregroundColor(.appGrayText)
                        
                    }
                }
            }
            
            Spacer()
            
            
            if isInDiscover {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 24))
                    .foregroundColor(.appBlueButton)
                    .onTapGesture {
                        isSaved.toggle()
                        //FUTURAMENTE LEVAR PARA A PAGINA DE SALVOS QUANDO SALVAR ALGUM PELA PRIMEIRA VEZ
                    }
            } else {
                NavigationLink(destination: ExperienceView(model: model)) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.appBlueButton)
                        .font(.title)
                }
            }
        }
    }
}

struct ExperienceCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCardView(model: .example1, isInDiscover: true, isSaved: true)
    }
}

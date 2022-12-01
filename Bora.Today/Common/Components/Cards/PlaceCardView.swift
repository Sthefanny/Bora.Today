//
//  PlaceCardView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 03/11/22.
//

import SwiftUI

struct PlaceCardView: View {
    let model: PlaceModel
    var isInDiscover: Bool
    @State var isSaved: Bool
    
    var body: some View {
        
        NavigationLink(destination: LocalsView(model: model)) {
            HStack(spacing: 0) {
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.appBlueButton)
                    
                    Text(String(format: "%.1f", 3)) // ToDo: pegar da Api
                    
                }.padding(.trailing, 22)
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(model.name)
                        .font(.appHeadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.appBlack)
                        .padding(.bottom, 8)
                    
                    
                    HStack(spacing: 0) {
                        Image("pin_place")
                            .foregroundColor(.black)
                            .padding(.trailing, 8)
                        
                        Text(model.address)
                            .font(.appFootnote)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.appGrayText)
                        
                    }
                    .padding(.bottom, 4)
                    
                }
                
                Spacer()
                
                VStack {
                    
                    
                    if isInDiscover {
                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 24))
                            .foregroundColor(.appBlueButton)
                            .onTapGesture {
                                isSaved.toggle()
                                //FUTURAMENTE LEVAR PARA A PAGINA DE SALVOS QUANDO SALVAR ALGUM PELA PRIMEIRA VEZ
                            }
                    } else {
                        NavigationLink(destination: LocalsView(model: model)) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.appBlueButton)
                                .font(.title)
                        }
                    }
                }
            }
        }
    }
}

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(model: .place1, isInDiscover: true, isSaved: false)
    }
}

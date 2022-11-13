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
    
    @State private var goesToLocal: Bool = false
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.appBlueButton)
                
                Text(String(format: "%.1f", model.rating))
        
            }.padding(.trailing, 22)
            
            
            VStack(alignment: .leading, spacing: 0) {
                Text(model.name)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                    .padding(.bottom, 8)
                
                
                HStack(spacing: 0) {
                    Image("pin_place")
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                    
                    Text(model.address)
                        .font(.appFootnote)
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
                    Image(systemName: "chevron.right")
                        .foregroundColor(.appBlueButton)
                        .font(.title)
                        .onTapGesture {
                            print("-leva para página da experiência-")
                    }
                }
            }
            
            NavigationLink(destination: LocalsView(model: model), isActive: $goesToLocal) {}
            
        }
        .onTapGesture {
            goesToLocal = true
        }
    }
}

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(model: .place2, isInDiscover: true, isSaved: false)
    }
}

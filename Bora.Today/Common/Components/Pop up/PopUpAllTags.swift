//
//  PopUpAllTags.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 21/11/22.
//

import SwiftUI

struct PopUpAllTags: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                
                if isPresented {
                    Color.black.opacity(isPresented ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        _buildHeader
                        
                        
                        VStack(alignment: .leading, spacing:21){
                            TagSegmentPopUpView(tagSegmentTitle: "Vibe", model:[
                                TagModel.familia,
                                TagModel.amigos,
                                TagModel.romance,
                                TagModel.independencia,
                            ])
                            TagSegmentPopUpView(tagSegmentTitle: "Arte e Cultura", model: [
                                TagModel.danca,
                                TagModel.jogos,
                                TagModel.musica,
                                TagModel.linguagens,
                                TagModel.museus,
                            ])
                            TagSegmentPopUpView(tagSegmentTitle: "Aventuras", model: [
                                TagModel.arLivre,
                                TagModel.passeios,
                                TagModel.natureza,
                                TagModel.adrenalina,
                                TagModel.parques,
                            ])
                            TagSegmentPopUpView(tagSegmentTitle: "Gastronomia", model: [
                                TagModel.comidas,
                                TagModel.happyHour,
                                TagModel.eventos,
                                TagModel.noPrecinho,
                                TagModel.bebidas,
                            ])
                            TagSegmentPopUpView(tagSegmentTitle: "Bem-estar", model: [
                                TagModel.saude,
                                TagModel.pets,
                                TagModel.hobbies,
                                TagModel.atividadeFísica,
                                TagModel.espiritualidade,
                            ])
                        }
                        //.padding(.horizontal, 21)
                        
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                    .frame(width: screen.size.width * 0.9 , height: screen.size.height * 0.95)
                    .background(Color.appWhite)
                    .cornerRadius(18)
                    .padding(.vertical, 0)
                }
            }
        }
    }
    
    private var _buildHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                
                Image(systemName: "xmark")
                    .font(.system(size: 20))
                    .onTapGesture {
                        isPresented.toggle()
                    }
            }
            
            Text("")
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appBlack)
        }
        .padding(.bottom, -21)
    }
}

struct PopUpAllTags_Previews: PreviewProvider {
    static var previews: some View {
        PopUpAllTags(isPresented: .constant(true))
    }
}

struct TagSegmentPopUpView: View {
    let tagSegmentTitle: String
    let model: [TagModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            Text(tagSegmentTitle)
                .font(.appHeadline)
                //.foregroundColor(.ap)
                .padding(.top, 0)
                .padding(.bottom, 8)
            
            TagDefaultListView(model: model)
        }
    }
}

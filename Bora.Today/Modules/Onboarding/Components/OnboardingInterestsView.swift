//
//  OnboardingInterestsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 21/10/22.
//

import SwiftUI

struct OnboardingInterestsView: View {
    
    let title: String
    let subheadline: String
    
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)

            VStack{
                VStack(alignment: .center, spacing: 0){
                    Text(title)
                        .font(.custom(AppFont.coveredByYourGrace.name, size: 40))
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                    
                    Text(subheadline)
                        .font(.appSubheadline)
                        .padding(.top, 0)
                        .padding(.bottom, 32)
                }
                .foregroundColor(.appWhite)
                .multilineTextAlignment(.center)
                .padding(.horizontal,21)
                
                ScrollView() {
                    VStack(alignment: .leading, spacing:16){
                        TagSegmentView(tagSegmentTitle: "Vibe", array:[
                            TagModel.familia,
                            TagModel.amigos,
                            TagModel.romance,
                            TagModel.independencia,
                        ])
                        TagSegmentView(tagSegmentTitle: "Arte e Cultura", array: [
                            TagModel.danca,
                            TagModel.jogos,
                            TagModel.musica,
                            TagModel.linguagens,
                            TagModel.museus,
                        ])
                        TagSegmentView(tagSegmentTitle: "Aventuras", array: [
                            TagModel.arLivre,
                            TagModel.passeios,
                            TagModel.natureza,
                            TagModel.adrenalina,
                            TagModel.parques,
                        ])
                        TagSegmentView(tagSegmentTitle: "Gastronomia", array: [
                            TagModel.comidas,
                            TagModel.happyHour,
                            TagModel.eventos,
                            TagModel.noPrecinho,
                            TagModel.bebidas,
                        ])
                        TagSegmentView(tagSegmentTitle: "Bem-estar", array: [
                            TagModel.saude,
                            TagModel.pets,
                            TagModel.hobbies,
                            TagModel.atividadeFísica,
                            TagModel.espiritualidade,
                        ])
                        .padding(.bottom, 64)
                    }
                    .padding(.horizontal,21)

                }
            }
        }
    }
}

struct OnboardingInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInterestsView(title: "Escolha até seis interesses", subheadline: "E receba recomendações personalizadas", backgroundColor: .appOrange)
    }
}

struct TagSegmentView: View {
    let tagSegmentTitle: String
    let array: [TagModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            Text(tagSegmentTitle)
                .font(.appHeadline)
                .foregroundColor(.appWhite)
                .padding(.top, 0)
                .padding(.bottom, 8)
            
            OnboardingInterestsListView(model: array)
        }
    }
}

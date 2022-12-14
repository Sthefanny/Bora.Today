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
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing:16){
                        TagSegmentView(tagSegmentTitle: "Vibe", model:[
                            TagModel.familia,
                            TagModel.amigos,
                            TagModel.romance,
                            TagModel.independencia,
                        ])
                        TagSegmentView(tagSegmentTitle: "Arte e Cultura", model: [
                            TagModel.danca,
                            TagModel.jogos,
                            TagModel.musica,
                            TagModel.linguagens,
                            TagModel.museus,
                        ])
                        TagSegmentView(tagSegmentTitle: "Aventuras", model: [
                            TagModel.arLivre,
                            TagModel.passeios,
                            TagModel.natureza,
                            TagModel.adrenalina,
                            TagModel.parques,
                        ])
                        TagSegmentView(tagSegmentTitle: "Gastronomia", model: [
                            TagModel.comidas,
                            TagModel.happyHour,
                            TagModel.eventos,
                            TagModel.noPrecinho,
                            TagModel.bebidas,
                        ])
                        TagSegmentView(tagSegmentTitle: "Bem-estar", model: [
                            TagModel.saude,
                            TagModel.pets,
                            TagModel.hobbies,
                            TagModel.atividadeF??sica,
                            TagModel.espiritualidade,
                        ])
                        .padding(.bottom, 64)
                    }
                    .padding(.horizontal, 21)

                }
                .padding(.bottom, 64)
            }
        }
    }
}

struct OnboardingInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInterestsView(title: "Escolha at?? seis interesses", subheadline: "E receba recomenda????es personalizadas", backgroundColor: .appOrange)
    }
}

struct TagSegmentView: View {
    let tagSegmentTitle: String
    let model: [TagModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            Text(tagSegmentTitle)
                .font(.appHeadline)
                .foregroundColor(.appWhite)
                .padding(.top, 0)
                .padding(.bottom, 8)
            
            OnboardingInterestsListView(model: model)
        }
    }
}

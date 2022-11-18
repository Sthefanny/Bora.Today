//
//  EditProfileInterestsListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 17/11/22.
//

import SwiftUI

struct EditProfileInterestsListView: View {
    let model: [TagModel]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 110)),
    ]
//    private let allTagsList: [TagModel] = [
//        TagModel.familia,
//        TagModel.amigos,
//        TagModel.romance,
//        TagModel.independencia,
//        TagModel.danca,
//        TagModel.jogos,
//        TagModel.musica,
//        TagModel.linguagens,
//        TagModel.museus,
//        TagModel.arLivre,
//        TagModel.passeios,
//        TagModel.natureza,
//        TagModel.adrenalina,
//        TagModel.parques,
//        TagModel.comidas,
//        TagModel.happyHour,
//        TagModel.eventos,
//        TagModel.noPrecinho,
//        TagModel.bebidas,
//        TagModel.saude,
//        TagModel.pets,
//        TagModel.hobbies,
//        TagModel.atividadeFísica,
//        TagModel.espiritualidade,
//    ]


    var body: some View {
        ZStack {
            LazyVGrid(columns: adaptiveColumns,alignment: .leading, spacing: 8) {
                ForEach(0..<model.count, id: \.self) { index in
                    let item = model[index]
                    TagDefaultView(model: item,isSelected: true)
                }
//                ForEach(0..<allTagsList.count, id: \.self) { index in
//                    let item = model[index]
//                    TagDefaultView(model: item,isSelected: false)
//                }
            }

        }
    }
}

struct EditProfileInterestsListView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileInterestsListView(model: [TagModel.example1])
    }
}


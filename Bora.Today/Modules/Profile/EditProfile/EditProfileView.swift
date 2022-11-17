//
//  EditProfileView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 16/11/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 110)),
    ]
    
    private let allTagsList: [TagModel] = [
        TagModel.familia,
        TagModel.amigos,
        TagModel.romance,
        TagModel.independencia,
        TagModel.danca,
        TagModel.jogos,
        TagModel.musica,
        TagModel.linguagens,
        TagModel.museus,
        TagModel.arLivre,
        TagModel.passeios,
        TagModel.natureza,
        TagModel.adrenalina,
        TagModel.parques,
        TagModel.comidas,
        TagModel.happyHour,
        TagModel.eventos,
        TagModel.noPrecinho,
        TagModel.bebidas,
        TagModel.saude,
        TagModel.pets,
        TagModel.hobbies,
        TagModel.atividadeFísica,
        TagModel.espiritualidade,
    ]
    
    
    @State var name: String = ""
    @State var username: String = ""
    @State var bio: String = ""
    @State var originCountry: String = ""
    @State var interests: String = ""
    
    let model : UserModel
    
    var body: some View {
        VStack{
            HeaderDoubleButtonsView(firstButtonText: "Cancelar", headerTitle: "Editar Perfil", secondButtonText: "Salvar")
                .padding(.bottom,32)
            
            UserPhotoAndEditButtonView(model: model)
                .padding(.bottom,32)
            
            VStack{
                HStack{
                    Text("Nome")
                        .font(.appCallout)
                    Spacer()
                    TextField(model.name, text: $name)
                        .font(.appFootnote)
                        .foregroundColor(.appGray)
                        .multilineTextAlignment(.trailing)
                    
                }
                Divider()
                
                HStack{
                    Text("Nome de usuário")
                        .font(.appCallout)
                    Spacer()
                    TextField("@" + model.username, text: $username)
                        .font(.appFootnote)
                        .foregroundColor(.appGray)
                        .multilineTextAlignment(.trailing)
                }
                Divider()
                
                HStack{
                    Text("Bio")
                        .font(.appCallout)
                    Spacer()
                    Text(model.bio)
                        .font(.appFootnote)
                        .foregroundColor(.appGray)
                        .lineLimit(5)
                        .multilineTextAlignment(.leading)
                        .frame(width: 238, height: 81)
                    
                    //                    TextField(model.bio, text: $bio, axis: .vertical)
                    //                        .frame(width: 238, height: 81)
                    //                        .lineLimit(5)
                    //                        .multilineTextAlignment(.leading)
                }
                Divider()
                
                HStack{
                    VStack(alignment:.leading, spacing: 4){
                        Text("País de Origem")
                            .font(.appCallout)
                        Text("Aparecerá no perfil")
                            .font(.appCaption1)
                            .foregroundColor(.appGray)
                    }
                    Spacer()
                    HStack(spacing:4){
                        Text(model.originCountry)
                            .font(.appFootnote)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(.appBlueButton)
                }
                Divider()
                
                HStack{
                    VStack(alignment:.leading, spacing: 4){
                        Text("Interesses")
                            .font(.appCallout)
                        Text("Máx. 3")
                            .font(.appCaption1)
                            .foregroundColor(.appGray)
                    }
                    Spacer()
                    ScrollView {
                        EditProfileInterestsListView(model: model.tags ?? [TagModel.museus])
                        ZStack {
                            LazyVGrid(columns: adaptiveColumns,alignment: .leading, spacing: 8) {
                                ForEach(0..<allTagsList.count, id: \.self) { index in
                                    let item = allTagsList[index]
                                    TagDefaultView(model: item,isSelected: false)
                                        .foregroundColor(.appGray)
                                }
                            }
                            .padding(1)
                        }
                    }
                    .frame(width: 190, height: .infinity)
                }
            }
            .padding(.horizontal,AppConfig.safeAreaHorizontal)
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(model: .example1)
    }
}

//
//  SettingsProfileView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 09/11/22.
//

import SwiftUI

struct SettingsProfileView: View {
    // MARK: - PROPERTIES
    
    @Binding var backgroundPrivateColor: Color
    let model : UserModel
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack{
                // MARK: - HEADER
                HeaderView(headerTitle: "Configurações")
                    .padding(.bottom,32)
                VStack {
                    // MARK: - SECTION PROFILE
                    Button(action: {}, label: {
                        GroupBox(content: {
                            SettingsProfileMyProfileRowView(model: model)
                        }, label: {
                        })
                        .groupBoxStyle(SettingsProfileGroupBoxStyle(backgroundPrivateColor: $backgroundPrivateColor))
                        .padding(.bottom,32)
                    }) //direcionar para ProfileEditView
            
                    // MARK: - SECTION CONFIGURAÇÕES
                    SettingsProfileLabelView(labelText: "Configurações")
                    GroupBox(content: {
                        SettingsProfileRowView(settingsRowType: .onlyText, title: "Idioma", linkLabel: "Português") //colocar ação no botao!
                    }, label: {
                    })
                    .groupBoxStyle(SettingsGroupBoxStyle())
                    .padding(.bottom, 32)
                    // MARK: - SECTION SOBRE
                    SettingsProfileLabelView(labelText: "Sobre")
                    GroupBox(content: {
                        VStack (spacing: 16){
                            SettingsProfileRowView(settingsRowType: .onlyImage, title: "BoraCast", linkDestination: "bora.today/")
                            Divider()
                                .frame(height:1)
                                .overlay(Color.appWhite)
                                .padding(.vertical,0)
                            SettingsProfileRowView(settingsRowType: .onlyImage, title: "Instagram", linkDestination: "www.instagram.com/boragroup_on/")
                            Divider()
                                .frame(height:1)
                                .overlay(Color.appWhite)
                                .padding(.vertical,0)
                            SettingsProfileRowView(settingsRowType: .onlyImage, title: "Sobre o Bora", linkDestination: "bora.today/")
                            Divider()
                                .frame(height:1)
                                .overlay(Color.appWhite)
                                .padding(.vertical,0)
                            SettingsProfileRowView(settingsRowType: .onlyImage, title: "Avaliar Bora.Today", linkDestination: "") //link da loja
                            Divider()
                                .frame(height:1)
                                .overlay(Color.appWhite)
                                .padding(.vertical,0)
                            SettingsProfileRowView(settingsRowType: .onlyImage, title: "Fale Conosco", linkDestination: "") //link email contato@bora.today //
                        }
                    }, label: {
                    })
                    .groupBoxStyle(SettingsGroupBoxStyle())
                    .padding(.bottom,32)
                    
    //                 MARK: - SECTION 1
                    GroupBox(content: {
                        SettingsProfileRowView(settingsRowType: .onlyTitle, title: "Sair", titleColor: .appRed, linkDestination: "")
                    }, label: {
                    })
                    .groupBoxStyle(SettingsGroupBoxStyle())
                    .padding(.bottom,32)
                   
                    // MARK: - SECTION 2
                    GroupBox(content: {
                        SettingsProfileRowView(settingsRowType: .onlyTitle, title: "Adicionar conta", titleColor: .appGreen, linkDestination: "")
                    }, label: {
                    })
                    .groupBoxStyle(SettingsGroupBoxStyle())
                    .padding(.bottom,32)
                }
                .padding(.horizontal, AppConfig.safeAreaHorizontal)
    //            Spacer()

            }
        }
    }
}

// MARK: - PREVIEW

struct SettingsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileView(backgroundPrivateColor: .constant(.appYellow), model: UserModel.example1)
    }
}

private struct HeaderView: View {
    
    var headerTitle: String?
    
    var body: some View {
        ZStack (alignment: .center){
            //            NavigationLink(destination: Text("ssi"), label: {
            Button(action: {print("clicou")}, label: {
                HStack(spacing:4){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                    Text("Voltar")
                        .font(.appButtonText)
                    Spacer()
                }.foregroundColor(Color.appBlueButton)
            })
            
            Text(headerTitle ?? "")
                .font(.appTitle2)
        } .padding(.horizontal, AppConfig.safeAreaHorizontal)
    }
}

struct SettingsGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.appLightGray))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct SettingsProfileGroupBoxStyle: GroupBoxStyle {
    @Binding var backgroundPrivateColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 26).fill(backgroundPrivateColor))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

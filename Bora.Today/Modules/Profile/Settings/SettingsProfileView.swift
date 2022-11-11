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
    
    // MARK: - BODY
    var body: some View {
        VStack{
            // MARK: - HEADER
            HeaderView(headerTitle: "Configurações")
            VStack {
                // MARK: - SECTION CONFIGURAÇÕES
                SettingsProfileLabelView(labelText: "Conexões")
                    GroupBox(content: {
                        
                        SettingsProfileRowView(title: "Idioma", imageName: "", linkLabel: "Portugues", linkDestination: "google")
                        HStack{
                            Text("Idioma")
                                .font(.appButtonText)
                                .foregroundColor(.appBlack)
                            Spacer()
                            Text("Português")
                                .font(.appSubheadline)
                                .foregroundColor(.appBlueButton)
                        }
                    }, label: {
                    })
                    .groupBoxStyle(SettingsGroupBox())
                    // MARK: - SECTION SOBRE
                SettingsProfileLabelView(labelText: "Sobre")
                    GroupBox(content: {
                        VStack{
                            HStack{
                                Text("BoraCast")
                                    .font(.appButtonText)
                                    .foregroundColor(.appBlack)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.appBlueButton)
                                    .frame(width: 13, height: 13)
                            }
                            Divider()
                                .frame(height:1)
                                .overlay(Color.appWhite)
                                .padding(.vertical,0)
                        }
                    }, label: {
                    })
                    .groupBoxStyle(SettingsGroupBox())
                    
                    // MARK: - SECTION 1
                    
                    // MARK: - SECTION 2

            }
            .padding(.horizontal, AppConfig.safeAreaHorizontal)
        }
    }
}

// MARK: - PREVIEW

struct SettingsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileView(backgroundPrivateColor: .constant(.appYellow))
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

struct SettingsGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.appLightGray))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

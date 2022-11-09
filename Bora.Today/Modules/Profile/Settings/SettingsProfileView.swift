//
//  SettingsProfileView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 09/11/22.
//

import SwiftUI

struct SettingsProfileView: View {
    
    @Binding var backgroundPrivateColor: Color
    
    var body: some View {
        VStack{
            HeaderView(headerTitle: "Configurações")
            VStack {
                HStack {
                    Text("Conexões")
                        .font(.appHeadline)
                    .foregroundColor(.appBlack)
                    Spacer()
                }
            }

        }
    }
}

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

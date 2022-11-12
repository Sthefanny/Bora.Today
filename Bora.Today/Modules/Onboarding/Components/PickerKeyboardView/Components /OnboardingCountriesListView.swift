//
//  OnboardingCountriesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 04/11/22.
//

import SwiftUI

struct OnboardingCountriesListView: View {
    var body: some View {
        VStack{
            HeaderView(headerTitle: "Selecionar país")
            Spacer(minLength: 32)
            CountriesListView()
        }
    }
}

struct OnboardingCountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCountriesListView()
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

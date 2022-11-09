//
//  OnboardingSelectCountryView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 21/10/22.
//

import SwiftUI

struct OnboardingSelectCountryView: View {
    
    @State var boraMeaningTitle: String
    @State var boraMeaningSubheadline: String
    @State var boraMeaningText: String
    @State var boraMeaningCallToAction: String
    
    var backgroundColor: Color
    var foregroundColor: Color
    @State private var showPicker: Bool = false
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 0) {
                    BoraMeaningView(boraMeaningTitle: $boraMeaningTitle, boraMeaningSubheadline: $boraMeaningSubheadline, boraMeaningText: $boraMeaningText, boraMeaningCallToAction: $boraMeaningCallToAction)
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("Qual seu país de origem?")
                            .font(.appTitle3)
                            .padding(.top, 32)
                            .padding(.bottom, 8)
                            .padding(.leading,21)
                        OnboardingCountryPickerView()
                            .frame(height: 50)
//                        NavigationLink(destination: OnboardingCountriesListView(), label: {
//                            OnboardingCountryPickerView()
//                                .frame(height: 50)
//                        })
                    }
                    .multilineTextAlignment(.center)
                }
            }
            .foregroundColor(.appWhite)
        }
    }
}

struct OnboardingSelectCountryView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSelectCountryView(boraMeaningTitle: "bo.ra.", boraMeaningSubheadline: "Substantivo feminino", boraMeaningText: "Expressão que incentiva a saída de outra pessoa ou que faça algo.\nPra gente, é como se fosse o pontapé inicial pra novas aventuras.", boraMeaningCallToAction: "então bora começar?",backgroundColor: .appBlue, foregroundColor: .appWhite)
        
        
    }
}

struct BoraMeaningView: View {
    
    @Binding var boraMeaningTitle: String
    @Binding var boraMeaningSubheadline: String
    @Binding var boraMeaningText: String
    @Binding var boraMeaningCallToAction: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(boraMeaningTitle)
                .font(.custom(AppFont.coveredByYourGrace.name, size: 64))
                .padding(.top, 0)
                .padding(.bottom, 8)
            Text(boraMeaningSubheadline)
                .font(.appTitle3)
                .padding(.top, 0)
                .padding(.bottom, 8)
            Text(boraMeaningText)
                .font(.appSubheadline)
                .padding(.top, 0)
                .padding(.bottom, 32)
            Text(boraMeaningCallToAction)
                .font(.custom(AppFont.coveredByYourGrace.name, size: 40))
                .padding(.top, 0)
                .padding(.bottom, 32)
        }
        .padding(.horizontal,21)
    }
}
